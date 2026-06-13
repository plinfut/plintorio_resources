--[[-----------------------------------------------------------------------------------------------
        TEMPLATES
-------------------------------------------------------------------------------------------------]]
local dd = require("modules.dataDefinitions")

--[[-----------------------------------------------------------------------------------------------
        TEMPLATES
-------------------------------------------------------------------------------------------------]]

local templateCreate = {
    select = {
        border_color = { r=0, g=1, b=0, a=1 },
        cursor_box_type = "entity",
        mode = "nothing"
    },
    alt_select = {
        border_color = { r=0, g=1, b=0, a=1 },
        cursor_box_type = "entity",
        mode = "nothing"
    },
    stack_size = 1,
    mouse_cursor = "selection-tool-cursor",
    flags = { "not-stackable", "only-in-cursor" },
    type = "selection-tool"
}
local templateRemove = table.deepcopy(templateCreate)
templateRemove.select.border_color = { r=1, g=0, b=0, a=1 }
templateRemove.alt_select.border_color = { r=1, g=0, b=0, a=1 }

--[[-----------------------------------------------------------------------------------------------
        CREATION TOOLS
-------------------------------------------------------------------------------------------------]]
for name,def in pairs(dd.create) do
    local tool = table.deepcopy(templateCreate)
    tool.icon = def.icon
    tool.name = "plintorio_resources_tool_create_"..name
    data:extend{tool}
end
