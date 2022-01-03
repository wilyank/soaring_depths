import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.MCItemDefinition;
import stdlib.List;

// this scripts does random tweaks and fixes

var _ = <item:minecraft:air>;

// end portal
craftingTable.removeRecipe(<item:minecraft:end_portal_frame>);
craftingTable.addShaped("end_portal_frame", 
    <item:minecraft:end_portal_frame>, 
    [
        [_, <item:minecraft:ender_pearl>, _],
        [<item:eidolon:shadow_gem>,<item:forbidden_arcanus:end_crystal_gem>, <item:eidolon:shadow_gem>], 
        [<item:infernalexp:glowstone_bricks>, <item:infernalexp:glowstone_bricks>, <item:infernalexp:glowstone_bricks>]
    ]);

// oredictionary fixes
var forge_gems = <tag:items:forge:gems>;
forge_gems.add(<item:biomesoplenty:nether_crystal>);
forge_gems.add(<item:betterendforge:amber_gem>);
forge_gems.add(<item:astralsorcery:resonating_gem>);
forge_gems.add(<item:eidolon:lesser_soul_gem>);
forge_gems.add(<item:eidolon:shadow_gem>);
forge_gems.add(<tag:items:forge:gems/end_crystal_gem>);
forge_gems.add(<item:bloodmagic:lavacrystal>);
<tag:items:forge:leather>.remove(<item:forbidden_arcanus:rotten_leather>);

// BOP sand casts
craftingTable.addShapeless("wite_sand_cast", 
    <item:tconstruct:blank_sand_cast>*4, 
    [
        <item:biomesoplenty:white_sand>
    ]);
craftingTable.addShapeless("orange_sand_cast", 
    <item:tconstruct:blank_red_sand_cast>*4, 
    [
        <item:biomesoplenty:orange_sand>
    ]);

// remove rail duping exploit with tinker's construct
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ingot_1");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ingot_6_16");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/gold/powered_rail");

// add cobalt crystal melting into cobalt
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_shard_melting", 
    <item:outer_end:cobalt_crystal_shard>, 
    <fluid:tconstruct:molten_cobalt>, 
    950, 
    10
);
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_melting", 
    <item:outer_end:cobalt_crystal>, 
    <fluid:tconstruct:molten_cobalt>*4, 
    950, 
    40
);
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_lamp_melting", 
    <item:outer_end:cobalt_crystal_lamp>, 
    <fluid:tconstruct:molten_cobalt>*4, 
    950, 
    40
);

// make soul sand and liquid soul automatable
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("sand_to_soul_sand", 
    <item:minecraft:sand>, 
    <fluid:tconstruct:blood> * 250, 
    <item:minecraft:soul_sand>, 200, 
    true, 
    false
);
<recipetype:tconstruct:melting>.addMeltingRecipe("soul_melting", 
    <item:forbidden_arcanus:soul>, 
    <fluid:tconstruct:liquid_soul> * 1000, 
    200, 
    500
);
<recipetype:tconstruct:melting>.addMeltingRecipe("dark_soul_melting", 
    <item:forbidden_arcanus:dark_soul>, 
    <fluid:tconstruct:liquid_soul> * 2000, 
    200, 
    500
);
mods.jei.JEI.addInfo(<item:forbidden_arcanus:soul>, ["Use a Soul Extracter on Soul Sand to get a soul."]);
mods.jei.JEI.addInfo(<item:minecraft:soul_sand>, ["Use a Soul Extracter on Soul Sand to get a soul."]);

// fix villager infinte diamonds
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/axes");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/shovel");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/weapon");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/boots");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/leggings");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/chestplate");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/helmet");



// change totem and void totem recipes
craftingTable.removeRecipe(<item:minecraft:totem_of_undying>);
craftingTable.removeRecipe(<item:voidtotem:totem_of_void_undying>);

craftingTable.addShaped("totem_of_undying", 
    <item:minecraft:totem_of_undying>,
    [
        [<item:forbidden_arcanus:soul>, <item:minecraft:glistering_melon_slice>, <item:forbidden_arcanus:soul>],
        [<item:minecraft:ghast_tear>, <item:unactivatedtotems:unactivated_totem>, <item:minecraft:ghast_tear>],
        [<item:eidolon:lesser_soul_gem>, <tag:items:forge:nether_stars>, <item:eidolon:lesser_soul_gem>]
    ]);
craftingTable.addShaped("totem_of_void_undying", 
    <item:voidtotem:totem_of_void_undying>,
    [
        [<item:forbidden_arcanus:soul>, <item:minecraft:chorus_fruit>, <item:forbidden_arcanus:soul>],
        [<tag:items:forge:ender_pearls>, <item:unactivatedtotems:unactivated_totem>, <tag:items:forge:ender_pearls>],
        [<item:eidolon:lesser_soul_gem>, <tag:items:forge:nether_stars>, <item:eidolon:lesser_soul_gem>]
    ]);

// fix Eidolon and Forbidden and Arcanus having wildly different ingots with the same name. Renaming is done in the lang files
<tag:items:forge:ingots/arcane_gold>.remove(<item:eidolon:arcane_gold_ingot>);
<tag:items:forge:ingots/redstone_gold>.add(<item:eidolon:arcane_gold_ingot>);

// fix bronze machines being crafted with brass
var s = <item:steampowered:bronze_sheet>;
var b = <item:minecraft:bricks>;
var p = <item:create:fluid_pipe>;
var i = <tag:items:forge:ingots/silicon_bronze>;
var pl = <tag:items:minecraft:planks>;
var c = <item:steampowered:bronze_cogwheel>;
var sh = <item:create:shaft>;
var a = <item:create:andesite_alloy>;

// bronze sheet
<recipetype:create:pressing>.addRecipe("bronze_sheet", [s], i);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("cast_bronze_sheet", 
    <item:tconstruct:plate_cast>, 
    <fluid:tconstruct:molten_tinkers_bronze> * 144, 
    s, 
    40, 
    false, 
    false
);


// small bronze cogwheel
craftingTable.removeRecipe(c);
craftingTable.addShaped("bronze_cogwheel",
    c,
    [
        [_, i, _],
        [i, a, i],
        [_, i, _]
    ]
    );
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_cogwheel",
    c,
    [
        [_, i, _],
        [i, a, i],
        [_, i, _]
    ]);
// large bronze cogwheel
craftingTable.removeRecipe(<item:steampowered:bronze_large_cogwheel>);
craftingTable.addShaped("bronze_large_cogwheel",
    <item:steampowered:bronze_large_cogwheel>,
    [
        [i, s, i],
        [s, a, s],
        [i, s, i]
    ]
    );
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_large_cogwheel",
    <item:steampowered:bronze_large_cogwheel>,
    [
        [i, s, i],
        [s, a, s],
        [i, s, i]
    ]);
// bronze burner
craftingTable.removeRecipe(<item:steampowered:bronze_burner>);
craftingTable.addShaped("bronze_burner", 
    <item:steampowered:bronze_burner>, 
    [
        [s, s, s],
        [s, _, s],
        [b, b, b]
    ]);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_burner", 
    <item:steampowered:bronze_burner>, 
    [
        [s, s, s],
        [s, _, s],
        [b, b, b]
    ]);
// bronze boiler
craftingTable.removeRecipe(<item:steampowered:bronze_boiler>);
craftingTable.addShaped("bronze_boiler",
    <item:steampowered:bronze_boiler>,
    [
        [s, s, s],
        [s, p, s],
        [s, p, s]
    ]);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_boiler", 
    <item:steampowered:bronze_boiler>,
    [
        [s, s, s],
        [s, p, s],
        [s, p, s]
    ]);
// bronze steam engine
<recipetype:create:mechanical_crafting>.removeRecipe(<item:steampowered:bronze_steam_engine>);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_steam_engine", 
    <item:steampowered:bronze_steam_engine>, 
    [
        [s, p, i],
        [s, p, <item:minecraft:piston>],
        [s, p, i]
    ]);
// bronze flywheel
<recipetype:create:mechanical_crafting>.removeRecipe(<item:steampowered:bronze_flywheel>);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_flywheel", 
    <item:steampowered:bronze_flywheel>,
    [
        [_, i, i, i, _],
        [i, c, pl, c, i],
        [i, pl, sh, pl, i],
        [i, c, pl, c, i],
        [_, i, i, i, _],
    ]);

// add steel?

// tweak electron tube recipe
craftingTable.removeRecipe(<item:create:rose_quartz>);
craftingTable.addShapeless("crafting_rose_quartz", <item:create:rose_quartz>, 
    [
        <item:minecraft:quartz>, 
        <item:minecraft:redstone>*4
    ]);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("casting_rose_quartz",
    <item:minecraft:redstone>,
    <fluid:tconstruct:molten_quartz>*144,
    <item:create:rose_quartz>,
    40,
    true,
    false
    );

<recipetype:create:filling>.addRecipe("electron_tube", 
    <item:create:electron_tube>, // output
    <item:create:polished_rose_quartz>, // input item
    <fluid:tconstruct:molten_iron>*16); // input fluid

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("rock_crystal_ore")
    .transitionTo(<item:minecraft:diorite>)
    .require(<tag:items:forge:ores>)
    .loops(1)
    .addOutput(<item:astralsorcery:rock_crystal_ore>, 1)
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:forbidden_arcanus:wet_purifying_soap>))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:minecraft:water>*250))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:tconstruct:molten_quartz>*144))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:portable_beacons:starberries>))
);