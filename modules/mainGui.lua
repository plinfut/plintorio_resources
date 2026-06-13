--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local ctm = require("modules.creationTab")
local ch = require("modules.creationHandler")

--[[-----------------------------------------------------------------------------------------------
        PRIVATE FUNCTIONS
-------------------------------------------------------------------------------------------------]]

--- Initializes the main frame of the GUI
---@param event table   An on_lua_shortcut event
---@return table # A LuaGuiElement of type tabbed-pane
local function initMf(event)
    -- Create the main frame
    local mf = game.get_player(event.player_index).gui.screen.add{ type="frame", direction="vertical", name="plintorio_resources_gui" }
    mf.auto_center = true
    -- Add the title bar
    local tb = mf.add{ type="flow", style="flib_titlebar_flow" }
    tb.drag_target = mf
    -- Add the title text
    tb.add{ type="label", caption={"plintorio_resources.gui_title"}, ignored_by_interaction=true, style="frame_title" }
    -- Add the drag handle
    local dh = tb.add{ type="empty-widget", style="flib_titlebar_drag_handle", ignored_by_interaction=true }
    -- Add the close button
    tb.add{
        type="sprite-button",
        style="frame_action_button",
        sprite="utility/close",
        hovered_sprite="utility/close_black",
        name="plintorio_resources_button_gui_close"
    }
    -- Add the tabbed pane
    return mf.add { type="tabbed-pane", style="flib_tabbed_pane_with_no_padding" }
end

--- Adds a tab to a tabbed pane
---@param tp table          A LuaGuiElement of type tabbed-pane
---@param action string     The name of an action for the caption. This is appended to "plintorio_resources.action_" to create a translation key.
---@return table # The content pane of the new tab
local function addTab(tp, action)
    local tab = tp.add{ type="tab", caption={"plintorio_resources.action_"..action} }
    local content = tp.add{ type="flow", direction="vertical" }
    tp.add_tab(tab, content)
    return content
end

--[[-----------------------------------------------------------------------------------------------
        PUBLIC MODULE
-------------------------------------------------------------------------------------------------]]

---@class Gui
local gui = {}

---Opens the GUI
---@param event table   An on_lua_shortcut event
function gui.open(event)
    if event.prototype_name == "plintorio_resources_gui_shortcut" and not game.get_player(event.player_index).gui.screen.plintorio_resources_gui then
        -- Initialize the main frame
        local tp = initMf(event)
        -- Add the tabs
        local ct = addTab(tp, "create")
        ctm.init(event.player_index, ct)
    end
end

--- Closes the GUI if it is open. Otherwise this does nothing.
---@param pi integer    A player_index in game.get_player
function gui.close(pi)
    local mf = game.get_player(pi).gui.screen.plintorio_resources_gui
    if mf then mf.destroy() end
end

--- Processes a click on any GUI button
---@param event table   An on_gui_click event
function gui.onClick(event)
    -- Check if the event pertains to this mod
    local elemName = event.element.name
    if string.sub(elemName, 1, 19) == "plintorio_resources" then
        local pi = event.player_index
        if elemName == "plintorio_resources_button_gui_close" then
            -- Handle the close button
            gui.close(pi)
        elseif string.sub(elemName, 1, 33) == "plintorio_resources_button_create" then
            -- Handle creation buttons
            ch.giveTool(pi, string.sub(elemName, 35))
            gui.close(pi)
        end
    end
end

return gui
