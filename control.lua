--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local gui = require("modules.mainGui")
local ch = require("modules.creationHandler")
local dd = require("modules.dataDefinitions")

--[[-----------------------------------------------------------------------------------------------
        PRIVATE FUNCTIONS
-------------------------------------------------------------------------------------------------]]

--- Dispatches an area selection event to a handler depending on the tool used
---@param event table   An on_player_selected_area or on_player_alt_selected_area event
local function onAreaSelected(event)
    -- Skip selections made with tools not belonging to this mod
    local toolName = event.item
    if string.sub(toolName, 1, 19) == "plintorio_resources" then
        -- Process event data
        local pi = event.player_index
        local area = {
            left_top = {
                x = math.ceil(event.area.left_top.x),
                y = math.ceil(event.area.left_top.y)
            },
            right_bottom = {
                x = math.floor(event.area.right_bottom.x),
                y = math.floor(event.area.right_bottom.y)
            }
        }
        -- Dispatch the event to a handler
        if string.sub(toolName, 1, 31) == "plintorio_resources_tool_create" then
            ch.processArea(event.surface, string.sub(toolName, 33), area)
        end
        -- Disable the selection tool
        game.get_player(event.player_index).cursor_stack.clear()
    end
end

--- Closes the GUI and takes away selection tools provided by this mod
---@param event table   An on_player_changed_surface event
local function onPlanetSwitch(event)
    gui.close(event.player_index)
    local stack = game.get_player(event.player_index).cursor_stack
    if stack.valid_for_read and string.sub(stack.prototype.name, 1, 24) == "plintorio_resources_tool" then
        stack.clear()
    end
end

--- Initializes the storage for original tiles
local function prepareStorage()
    if storage.origTiles == nil then storage.origTiles = {} end
    for _,planet in pairs(dd.planets) do
        if storage.origTiles[planet] == nil then storage.origTiles[planet] = {} end
    end
end

--[[-----------------------------------------------------------------------------------------------
        TRIGGERS
-------------------------------------------------------------------------------------------------]]

-- Open the GUI when the shortcut is clicked
script.on_event(defines.events.on_lua_shortcut, gui.open)
-- Determine what to do when a GUI element is clicked
script.on_event(defines.events.on_gui_click, gui.onClick)

-- Respond to area selections
script.on_event(defines.events.on_player_selected_area, onAreaSelected)
script.on_event(defines.events.on_player_alt_selected_area, onAreaSelected)

-- Prevent carrying the GUI or tools to other planets
script.on_event(defines.events.on_player_changed_surface, onPlanetSwitch)

-- Prepare the storage for old tiles
script.on_init(prepareStorage)
script.on_configuration_changed(prepareStorage)
