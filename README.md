# Plintorio - Resource Creator

A mod for the game Factorio that allows players to quickly create rectangle resource patches.

## Features

- Click the button in the shortcut bar to open a GUI. Then choose a resource and select an area to fill with the chosen resource.
    - Only full tiles within the selected area are filled. The tiles the box is drawn through are excluded.
    - Fields that require a pumpjack to extract from are sufficiently spaced to place pumpjacks side by side in rows, with room between rows for pipes and electricity poles.
    - An error message is shown in the chat if the selected area is too small to fit at least one resource instance.
    - If an entity can only occur on certain terrains, the appropriate tile is automatically placed along with the entity.
- The amount of resources that can be extracted from each tile before it disappears can be configured through a map setting.
    - This only applies to ore patches created after the setting was changed.
    - Maximum value: 400 million. (That's 3.6 billion per electric mining drill as it covers 9 tiles.)
    - Default value: 10k per tile, or 90k per electric mining drill.
    - Resources extracted by a pumpjack or offshore pump never run dry regardless of this setting, just like vanilla Factorio sources.
- Only resources native to the current planet can be created by default. A map setting is available to allow the creation of all resources on all planets.

Available resources:
- Nauvis
    - Copper ore
    - Coal
    - Crude oil
    - Iron ore
    - Stone
    - Trees
    - Uranium ore
    - Fish (in deep water)
    - Deep water
- Vulcanus
    - Ashland trees
    - Calcite
    - Coal
    - Sulfaric acid geysers
    - Tungsten ore
    - Lava
- Gleba
    - Stone
    - Copper stromatolite (in shallow water)
    - Iron stromatolite (in shallow water)
    - Jellystem (on jellynut soil)
    - Yumako tree (on yumako soil)
    - Shallow water
    - Jellynut wetland
    - Yumako wetland
- Fulgora
    - Scrap
    - Oil ocean
- Aquilo
    - Crude oil
    - Fluorine vents
    - Lithium brine
    - Ltihium ice formations
        - Both types yield ice, lithium and ice platforms
        - Big formations yield more ice and lithium per tile
        - Huge formations yield more ice platforms per tile
    - Ammoniacal ocean

## Known issues

- Resources that span multiple tiles may not cover the entire selected area.
    - Filling starts at the top left of the selected area and repeats horizontally and vertically.
    - If the selected area is larger than an exact multiple of the resource's size, it leaves a gap on the right and/or bottom side.
    - This also affects pumpjack resources as the mandatory spacing is considered part of the instance's size, despite the source itself only being 1x1 tile.
    - This is just how space works. I can't place half a resource or squeeze a full resource into a smaller area.

## About Plintorio

All my mods are primarily developed for my own specific use cases and I don't plan on making major additions I wouldn't use myself. But I'm open to small changes for others, and your suggestions may inspire me to use my own mods differently too, so bigger changes aren't out of the question. (And Factorio is pretty flexible, so some updates might be easier than you'd think.) All feedback is welcome and will be taken into consideration.

Some features may feel like cheating, but I learned an important lesson a while ago: there is no right or wrong way to play games. Adjusting the single player mode doesn't affect anyone else in Factorio and as you bought it, you have the right to enjoy it the way *you* want. You don't have to stick to how the creators intended it or how others prefer it.
