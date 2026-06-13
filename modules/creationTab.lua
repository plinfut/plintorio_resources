--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local dd = require("modules.dataDefinitions")

--[[-----------------------------------------------------------------------------------------------
        PRIVATE FUNCTIONS
-------------------------------------------------------------------------------------------------]]

--- Adds a button group for a particular planet
---@param tab table         A LuaGuiElement of type flow or frame
---@param planet string     The internal name of a planet
local function addButtonGroup(tab, planet)
    local frame = tab.add{ type="frame", caption={"space-location-name."..planet}, style="inside_shallow_frame_with_padding" }
    for name,def in pairs(dd.create) do
        if def.planets[planet] then
            frame.add{
                type = "sprite-button",
                name = "plintorio_resources_button_create_"..name,
                tooltip = {"", {"plintorio_resources.action_create"}, " ", {def.type.."-name."..name}},
                sprite = def.type.."/"..name
            }
        end
    end
end

--[[-----------------------------------------------------------------------------------------------
        PUBLIC MODULE
-------------------------------------------------------------------------------------------------]]

---@class CreationTab
local ct = {}

--- Initializes the creation tab
---@param pi integer    A player_index in game.get_player
---@param tab table     A LuaGuiElement of type flow or frame
function ct.init(pi, tab)
    -- Add the current planet on top
    local currentPlanet = game.get_player(pi).surface.name
    addButtonGroup(tab, currentPlanet)
    -- Add other planets
    if not settings.global["plintorio_resources_filter_native"].value then
        for _,planet in pairs(dd.planets) do
            if planet ~= currentPlanet then
                addButtonGroup(tab, planet)
            end
        end
    end
end

return ct
