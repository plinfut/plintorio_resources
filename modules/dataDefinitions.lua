--[[-----------------------------------------------------------------------------------------------
        PRIVATE CREATION TOOLS
-------------------------------------------------------------------------------------------------]]

-- OBS: mods table only exists during the data stage and script.active_mods only during the control
-- stage, but this file is used in both.
local activeMods = mods or script.active_mods

local create = {}
create["ashland-lichen-tree"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { vulcanus=true }
}
create["calcite"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/calcite.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { vulcanus=true }
}
create["copper-ore"] = {
    type = "entity",
    icon = "__base__/graphics/icons/copper-ore.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { nauvis=true }
}
create["coal"] = {
    type = "entity",
    icon = "__base__/graphics/icons/coal.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets={ nauvis=true, vulcanus=true }
}
create["crude-oil"] = {
    type = "entity",
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
    positioning = {
        offset = { x=1, y=1 },
        size = { x=1, y=1 },
        spacing = { x=3, y=2 }
    },
    planets={ nauvis=true, aquilo=true }
}
create["fluorine-vent"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/fluid/fluorine.png",
    positioning = {
        offset = { x=1, y=1 },
        size = { x=1, y=1 },
        spacing = { x=3, y=2 }
    },
    planets = { aquilo=true }
}
create["iron-ore"] = {
    type = "entity",
    icon = "__base__/graphics/icons/iron-ore.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { nauvis=true }
}
create["lithium-brine"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/lithium-brine.png",
    positioning = {
        offset = { x=1, y=1 },
        size = { x=1, y=1 },
        spacing = { x=3, y=2 }
    },
    planets = { aquilo=true }
}
create["lithium-iceberg-big"] = {
    type="entity",
    icon="__space-age__/graphics/icons/lithium-iceberg-big.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=3, y=2 },
        spacing = { x=0, y=0 }
    },
    planets = { aquilo=true }
}
create["lithium-iceberg-huge"] = {
    type="entity",
    icon="__space-age__/graphics/icons/lithium-iceberg-huge.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=5, y=3 },
        spacing = { x=0, y=0 }
    },
    planets = { aquilo=true }
}
create["scrap"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/scrap.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { fulgora=true }
}
create["sulfuric-acid-geyser"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/sulfuric-acid-geyser.png",
    positioning = {
        offset = { x=1, y=1 },
        size = { x=1, y=1 },
        spacing = { x=3, y=2 }
    },
    planets = { vulcanus=true }
}
create["stone"] = {
    type = "entity",
    icon = "__base__/graphics/icons/stone.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { nauvis=true, gleba=true }
}
create["tree-01"] = {
    type = "entity",
    icon = "__base__/graphics/icons/tree-01.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { nauvis=true }
}
create["tungsten-ore"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/tungsten-ore.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = { vulcanus=true }
}
create["uranium-ore"] = {
    type = "entity",
    icon = "__base__/graphics/icons/uranium-ore.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    planets = {nauvis=true}
}
create["copper-stromatolite"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/copper-stromatolite.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    tile = "water-shallow",
    planets = { gleba=true }
}
create["fish"] = {
    type="entity",
    icon="__base__/graphics/icons/fish-entity.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    tile="deepwater",
    planets={nauvis=true}
}
create["iron-stromatolite"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/iron-stromatolite.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    tile = "water-shallow",
    planets = { gleba=true }
}
create["jellystem"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/jellystem.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    tile = "natural-jellynut-soil",
    planets = { gleba=true }
}
create["yumako-tree"] = {
    type = "entity",
    icon = "__space-age__/graphics/icons/yumako-tree.png",
    positioning = {
        offset = { x=0, y=0 },
        size = { x=1, y=1 },
        spacing = { x=0, y=0 }
    },
    tile = "natural-yumako-soil",
    planets = { gleba=true }
}
create["ammoniacal-ocean"] = {
    type = "tile",
    icon = "__space-age__/graphics/icons/fluid/ammonia.png",
    planets = { aquilo=true }
}
create["deepwater"] = {
    type = "tile",
    icon = "__base__/graphics/icons/fluid/water.png",
    planets = { nauvis=true }
}
create["lava-hot"] = {
    type = "tile",
    icon = "__space-age__/graphics/icons/fluid/lava.png",
    planets = {vulcanus=true}
}
create["oil-ocean-shallow"] = {
    type = "tile",
    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
    planets = { fulgora=true }
}
create["water-shallow"] = {
    type = "tile",
    icon = "__base__/graphics/icons/fluid/water.png",
    planets = { gleba=true }
}
create["wetland-jellynut"] = {
    type = "tile",
    icon = "__space-age__/graphics/icons/wetland-jellynut.png",
    planets = { gleba=true }
}
create["wetland-yumako"] = {
    type = "tile", icon = "__space-age__/graphics/icons/wetland-yumako.png",
    planets = { gleba=true }
}

--[[-----------------------------------------------------------------------------------------------
        COMPATIBILITY: FACTORIO+
-------------------------------------------------------------------------------------------------]]
if activeMods["factorioplus"] then
    create["aquifer"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/resource-aquifer.png",
        positioning = {
            offset = { x=1, y=1 },
            size = { x=1, y=1 },
            spacing = { x=3, y=2 }
        },
        planets = { nauvis=true }
    }
    create["bauxite-ore"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/bauxite-ore.png",
        positioning = {
            offset = { x=0, y=0 },
            size = { x=1, y=1 },
            spacing = { x=0, y=0 }
        },
        planets = { nauvis=true }
    }
    create["forest"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/resource-forest.png",
        positioning = {
            offset = { x=2, y=2 },
            size = { x=1, y=1 },
            spacing = { x=5, y=4 }
        },
        planets = { nauvis=true }
    }
    create["geothermal-vent"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/resource-geothermal.png",
        positioning = {
            offset = { x=2, y=2 },
            size = { x=1, y=1 },
            spacing = { x=5, y=4 }
        },
        planets = { nauvis=true, vulcanus=true }
    }
    create["goblin-ore"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/goblin-ore.png",
        positioning = {
            offset = { x=0, y=0 },
            size = { x=1, y=1 },
            spacing = { x=0, y=0 }
        },
        planets = { nauvis=true }
    }
    create["goblin-ore-2"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/goblin-ore.png",
        positioning = {
            offset = { x=0, y=0 },
            size = { x=1, y=1 },
            spacing = { x=0, y=0 }
        },
        planets = { nauvis=true }
    }
    create["goblin-ore-3"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/goblin-ore.png",
        positioning = {
            offset = { x=0, y=0 },
            size = { x=1, y=1 },
            spacing = { x=0, y=0 }
        },
        planets = { nauvis=true }
    }
    create["iron-ore-pure"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/iron-ore-pure-1.png",
        positioning = {
            offset = { x=0, y=0 },
            size = { x=1, y=1 },
            spacing = { x=0, y=0 }
        },
        planets = { nauvis=true }
    }
    create["natural-gas"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/resource-natural-gas.png",
        positioning = {
            offset = { x=2, y=2 },
            size = { x=1, y=1 },
            spacing = { x=5, y=4 }
        },
        planets = { nauvis=true, gleba=true }
    }
    create["sand-ore"] = {
        type = "entity",
        icon = "__factorioplus__/graphics/icons/sand.png",
        positioning = {
            offset = { x=0, y=0 },
            size = { x=1, y=1 },
            spacing = { x=0, y=0 }
        },
        planets = { nauvis=true }
    }
    if activeMods["space-age"] then
        create["bauxite-stromatolite"] = {
            type = "entity",
            icon = "__space-age__/graphics/icons/iron-stromatolite.png",
            positioning = {
                offset = { x=0, y=0 },
                size = { x=1, y=1 },
                spacing = { x=0, y=0 }
            },
            tile = "water-shallow",
            planets = { gleba=true }
        }
    end
end

--[[-----------------------------------------------------------------------------------------------
        PUBLIC MODULE
-------------------------------------------------------------------------------------------------]]
return {
    create=create,
    planets={"nauvis", "vulcanus", "gleba", "fulgora", "aquilo"}
}
