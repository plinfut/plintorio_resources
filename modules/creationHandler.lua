--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local dd = require("modules.dataDefinitions")

--[[-----------------------------------------------------------------------------------------------
        PRIVATE FUNCTIONS
-------------------------------------------------------------------------------------------------]]

--- Covers an area in entities that provide a resource
---@param pi integer        A player_index in game.get_player
---@param surface table     The LuaSurface the area was selected on
---@param area table        A BoundingBox with coordinates rounded to full tiles
---@param resName string    The name of a resource
---@param resDef table      A definition of a resource entity from toolDefinitions
local function placeEntities(pi, surface, area, resName, resDef)
    -- Compile loop variables
     local startX = area.left_top.x + (resDef.positioning.size.x / 2) + resDef.positioning.offset.x
    local startY = area.left_top.y + (resDef.positioning.size.y / 2) +  resDef.positioning.offset.y
    local endX = area.right_bottom.x - (resDef.positioning.size.x / 2) -  resDef.positioning.offset.x
    local endY = area.right_bottom.y - (resDef.positioning.size.y / 2) - resDef.positioning.offset.y
    local incX = resDef.positioning.size.x + resDef.positioning.spacing.x
    local incY = resDef.positioning.size.y + resDef.positioning.spacing.y
    local amount = settings.global["plintorio_resources_resource_amount"].value
    -- Ensure at least one resource fits within the selection.
    if (startX + incX > endX) or (startY + incY > endY) then
        game.get_player(pi).print({"plintorio_resources.area_too_small"}, {color={r=1,g=0,b=0,a=1}})
        return
    end
    -- Loop through x-coordinates
    local x = startX
    while x <= endX do
        -- Loop through y-coordinates
        local y = startY
        while y <= endY do
            -- Place the entity
            if surface.can_place_entity{ name=resName, position={x, y}, build_check_type=defines.build_check_type.manual } then
                surface.create_entity{
                    name = resName,
                    position = {x, y},
                    create_build_effect_smoke = false,
                    move_stuck_players = true,
                    register_plant = true,
                    amount = amount,
                    player = pi,
                }
            end
            y = y + incY
        end
        x = x + incX
    end
end

--- Covers an area in tiles that provide a resource
---@param pi integer        A player_index in game.get_player
---@param surface table     The LuaSurface the area was selected on
---@param area table        A BoundingBox with coordinates rounded to full tiles
---@param tileName string   The name of a tile
local function replaceTiles(pi, surface, area, tileName)
    -- Ensure at least one tile fits within the selection
    if (area.right_bottom.x - area.left_top.x < 1) or (area.right_bottom.y - area.left_top.y < 1) then
        game.get_player(pi).print({"plintorio_resources.area_too_small"}, {color={r=1,g=0,b=0,a=1}})
        return
    end
    local tiles = {}
    for x = area.left_top.x, area.right_bottom.x-1 do
        for y = area.left_top.y, area.right_bottom.y-1 do
            if storage.origTiles[surface.name][x.."/"..y] == nil then
                storage.origTiles[surface.name][x.."/"..y] = surface.get_tile(x, y).name
            end
            table.insert(tiles, {name=tileName, position={x,y}})
        end
    end
    surface.set_tiles(tiles, false, true, true, false, pi)
end

--[[-----------------------------------------------------------------------------------------------
        PUBLIC MODULE
-------------------------------------------------------------------------------------------------]]

---@class CreationHandler
local ch = {}

--- Fills an area with resource entities and/or tiles
---@param surface table     The LuaSurface the area was selected on
---@param resName string    The name of a resource
---@param area table        A BoundingBox with coordinates rounded to full tiles
function ch.processArea(pi, surface, resName, area)
    local resDef = dd.create[resName]
    if resDef.type == "tile" then
        replaceTiles(pi, surface, area, resName)
    elseif resDef.type == "entity" then
        if resDef.tile then replaceTiles(pi, surface, area, resDef.tile) end
        placeEntities(pi, surface, area, resName, resDef)
    end
end

--- Gives the player a tool to select an area to populate with resources
---@param pi integer        A player_index in game.get_player
---@param resName string    The name of a resource
function ch.giveTool(pi, resName)
    local player = game.get_player(pi)
    player.clear_cursor()
    player.cursor_stack.set_stack("plintorio_resources_tool_create_"..resName)
end

return ch
