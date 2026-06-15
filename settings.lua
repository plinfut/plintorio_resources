data:extend{
    {
        name = "plintorio_resources_filter_native",
        type = "bool-setting",
        default_value = true,
        order = "a",
        setting_type = "runtime-global"
    },
    {
        name = "plintorio_resources_resource_amount",
        type = "int-setting",
        default_value = 10000,
        minimum_value = 1,
        maximum_value = 400000000,
        order = "b",
        setting_type = "runtime-global"
    }
}
