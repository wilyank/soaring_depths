#priority 99

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.MCItemDefinition;
import stdlib.List;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;

import mods.angrymobs.AITweaks;

// this scripts does random tweaks and fixes

// remove all stupid sequenced assembly recipes
<recipetype:create:sequenced_assembly>.removeAll();

// remove distracting item filters
mods.jei.JEI.hideMod("itemfilters");

var _ = <item:minecraft:air>;

// end portal
craftingTable.removeRecipe(<item:minecraft:end_portal_frame>);
<recipetype:create:mechanical_crafting>.addRecipe("end_portal_frame", 
    <item:minecraft:end_portal_frame>*3, 
    [
        [<item:astralsorcery:resonating_gem>, <item:create:shadow_steel>, <item:astralsorcery:resonating_gem>],
        [<item:eidolon:shadow_gem>, <item:forbidden_arcanus:end_crystal_gem>, <item:eidolon:shadow_gem>], 
        [<item:minecraft:end_stone_bricks>, <item:create:refined_radiance>, <item:minecraft:end_stone_bricks>]
    ]);
craftingTable.addShaped("end_crystal",
    <item:minecraft:end_crystal>,
    [
        [<tag:items:forge:glass/colorless>, <tag:items:forge:glass/colorless>, <tag:items:forge:glass/colorless>],
        [<tag:items:forge:glass/colorless>, <item:minecraft:ender_eye>, <tag:items:forge:glass/colorless>],
        [<tag:items:forge:glass/colorless>, <item:eidolon:wraith_heart>, <tag:items:forge:glass/colorless>]
    ]
);

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
// add netherite monstrosity drop melting
<recipetype:tconstruct:melting>.addMeltingRecipe("monstrous_horn_melting", 
    <item:cataclysm:monstrous_horn>, 
    <fluid:tconstruct:molten_netherite>*720, 
    1250, 
    360
);
<recipetype:tconstruct:melting>.addMeltingRecipe("infernal_forge_melting", 
    <item:cataclysm:infernal_forge>, 
    <fluid:tconstruct:molten_netherite>*1296, 
    1250, 
    360
);

// make soul sand and liquid soul automatable
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("sand_to_soul_sand", 
    <item:minecraft:sand>, 
    <fluid:tconstruct:magma> * 250, 
    <item:minecraft:soul_sand>, 
    200, 
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

// make marble automatable
<recipetype:create:mixing>.addRecipe("marble",
    "heated",
    <item:astralsorcery:marble_raw>*2,
    [<item:create:diorite_cobblestone>, <item:create:limesand>]
);

// do some cobble gen stuff
<recipetype:astralsorcery:liquid_interaction>.removeRecipe(<item:minecraft:stone>);
<recipetype:astralsorcery:liquid_interaction>.removeRecipe(<item:minecraft:obsidian>);
<recipetype:astralsorcery:liquid_interaction>.removeRecipe(<item:minecraft:cobblestone>);

<recipetype:astralsorcery:liquid_interaction>.addRecipe("cobble_liquid_interaction", <item:minecraft:cobblestone>, <fluid:minecraft:water>*1000, 0, <fluid:minecraft:lava>*1000, 0, 10);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("granite_cobble_liquid_interaction", <item:create:granite_cobblestone>, <fluid:minecraft:water>*1000, 0, <fluid:minecraft:lava>*1000, 0, 10);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("andesite_cobble_liquid_interaction", <item:create:andesite_cobblestone>, <fluid:minecraft:water>*1000, 0, <fluid:minecraft:lava>*1000, 0, 10);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("diorite_cobble_liquid_interaction", <item:create:diorite_cobblestone>, <fluid:minecraft:water>*1000, 0, <fluid:minecraft:lava>*1000, 0, 10);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("gabbro_cobble_liquid_interaction", <item:create:gabbro_cobblestone>, <fluid:minecraft:water>*1000, 0, <fluid:minecraft:lava>*1000, 0, 10);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("scoria_cobble_liquid_interaction", <item:create:scoria_cobblestone>, <fluid:minecraft:water>*1000, 0, <fluid:minecraft:lava>*1000, 0, 10);

<recipetype:tconstruct:casting_basin>.removeByName("tconstruct:smeltery/casting/quartz/granite");
<recipetype:tconstruct:casting_basin>.removeByName("tconstruct:smeltery/casting/quartz/diorite");
<recipetype:tconstruct:casting_basin>.removeByName("tconstruct:smeltery/casting/quartz/andesite");

craftingTable.addShapeless("darkstone",
    <item:forbidden_arcanus:darkstone>,
    [
        <item:minecraft:stone>,
        <item:minecraft:blackstone>
    ]
);

<recipetype:create:mixing>.addRecipe("darkstone_mixing",
    "none",
    <item:forbidden_arcanus:darkstone>,
    [
        <item:minecraft:stone>,
        <item:minecraft:blackstone>
    ]
);

// fix villager infinte diamonds
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/axes");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/shovel");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/weapon");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/boots");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/leggings");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/chestplate");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/helmet");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ingot_4");

villagerTrades.removeItemsForEmeraldsTrade(<profession:minecraft:mason>, 5, <item:minecraft:quartz_block>);
villagerTrades.removeItemsForEmeraldsTrade(<profession:minecraft:mason>, 5, <item:minecraft:quartz_pillar>);


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
    ]
);


// ore hiding and descriptions
mods.jei.JEI.hideIngredient(<item:tconstruct:copper_ore>);
if (loadedMods.isModLoaded("jeresources")) {
    mods.jei.JEI.hideCategory("jeresources:worldgen");
}
var style = new MCStyle().setColor(11184810);
<item:create:copper_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.copper").setStyle(style));
<item:create:zinc_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.zinc").setStyle(style));

<item:minecraft:coal_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.coal").setStyle(style));
<item:minecraft:iron_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.iron").setStyle(style));
<item:minecraft:gold_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.gold").setStyle(style));
<item:minecraft:redstone_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.redstone").setStyle(style));
<item:minecraft:diamond_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.diamond").setStyle(style));
<item:minecraft:lapis_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.lapis").setStyle(style));
<item:eidolon:lead_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.lead").setStyle(style));
<item:forbidden_arcanus:arcane_crystal_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.arcane_crystal").setStyle(style));
<item:astralsorcery:rock_crystal_ore>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.ores.rock_crystal").setStyle(style));



// banana milk shake
<recipetype:create:mixing>.addRecipe("banana_milkshake",
    "none",
    <item:minecraft:potion>.withTag({display:{Name:'{"text":"Banana Milk Shake","color":"white","italic":false}'},CustomPotionEffects:[{Id:3,Amplifier:0,Duration:1200},{Id:23,Amplifier:0,Duration:200}],CustomPotionColor:16772611}),
    [<item:minecraft:ice>, <item:alexsmobs:banana>],
    [<fluid:minecraft:milk>*250]
);
mods.jei.JEI.addItem(<item:minecraft:potion>.withTag({display:{Name:'{"text":"Banana Milk Shake","color":"white","italic":false}'},CustomPotionEffects:[{Id:3,Amplifier:0,Duration:1200},{Id:23,Amplifier:0,Duration:200}],CustomPotionColor:16772611}));

craftingTable.addShaped("banana_pickaxe", <item:eidolon:pewter_blend>, [[<item:alexsmobs:banana>],[<item:minecraft:stick>]]);

// make turtle eggs obtainable
villagerTrades.addWanderingTrade(1, <item:rubber_duck:rubber_duck_item>, <item:minecraft:turtle_egg>, 4, 2);


// remove distracting Mowzie's Mobs items from JEI
mods.jei.JEI.hideIngredient(<item:mowziesmobs:barakoa_mask_fury>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:barakoa_mask_fear>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:barakoa_mask_rage>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:barakoa_mask_bliss>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:barakoa_mask_misery>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:barakoa_mask_faith>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:barako_mask>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:grant_suns_blessing>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:earth_talisman>);
mods.jei.JEI.hideIngredient(<item:mowziesmobs:mob_remover>);

mods.jei.JEI.addDescription(<item:minecraft:kelp>,"Trade with a Wandering Trader or a Kobold to obtain this.");
mods.jei.JEI.addDescription(<item:minecraft:sugar_cane>,"Trade with a Kobold to obtain this.");
mods.jei.JEI.addDescription(<item:forbidden_arcanus:stellarite_piece>,"See Stella Arcanum");


craftingTable.addShapeless("painted_acacia_wood",
    <item:mowziesmobs:painted_acacia>,
    [<item:minecraft:acacia_planks>,<tag:items:forge:dyes>]
);

mods.jei.JEI.hideIngredient(<item:ftblibrary:fluid_container>);

craftingTable.addShaped("copper_bucket",
    <item:minecraft:bucket>,
    [
        [<tag:items:forge:ingots/copper>, _, <tag:items:forge:ingots/copper>],
        [_, <tag:items:forge:ingots/copper>, _]
    ]
);
craftingTable.removeRecipe(<item:mining_helmet:mining_helmet>);
craftingTable.addShaped("mining_helmet",
    <item:mining_helmet:mining_helmet>,
    [
        [<tag:items:forge:dyes/red>, <tag:items:forge:lanterns>, <tag:items:forge:dyes/red>],
        [<item:create:andesite_alloy>, <item:create:andesite_alloy>, <item:create:andesite_alloy>],
        [<item:create:andesite_alloy>, _, <item:create:andesite_alloy>]
    ]
);

// crushed ores
furnace.removeByName("minecraft:iron_ingot");
furnace.removeByName("minecraft:gold_ingot");
furnace.removeByName("minecraft:quartz");
furnace.removeByName("minecraft:diamond_from_smelting");
furnace.removeByName("minecraft:coal_from_smelting");
furnace.removeByName("minecraft:lapis_from_smelting");
furnace.removeByName("minecraft:emerald_from_smelting");
furnace.removeByName("eidolon:smelt_lead_ore");
furnace.removeByName("create:smelting/copper_ingot_from_ore");
furnace.removeByName("create:smelting/zinc_ingot_from_ore");
furnace.removeByName("forbidden_arcanus:arcane_crystal_from_smelting");
furnace.removeRecipe(<item:forbidden_arcanus:arcane_crystal_dust>);
blastFurnace.removeRecipe(<item:forbidden_arcanus:arcane_crystal_dust>);

<recipetype:create:crushing>.addRecipe("crushed_arcane_crystal", [<item:forbidden_arcanus:arcane_crystal>, <item:forbidden_arcanus:arcane_crystal>%20], <item:forbidden_arcanus:arcane_crystal_ore>);
<recipetype:create:crushing>.addRecipe("crushed_arcane_crystal_dust_crushing", [<item:forbidden_arcanus:arcane_crystal_dust>, <item:forbidden_arcanus:arcane_crystal_dust>%10], <item:forbidden_arcanus:arcane_crystal>);
<recipetype:create:milling>.addRecipe("crushed_arcane_crystal_dust_milling", [<item:forbidden_arcanus:arcane_crystal_dust>, <item:forbidden_arcanus:arcane_crystal_dust>%10], <item:forbidden_arcanus:arcane_crystal>);

<recipetype:create:crushing>.removeRecipe(<item:create:crushed_copper_ore>);
<recipetype:create:crushing>.addRecipe("crushed_copper_ore", [<item:create:crushed_copper_ore>, <item:create:crushed_copper_ore>*2 % 30, <item:minecraft:cobblestone> % 12], <tag:items:forge:ores/copper>);
<recipetype:create:crushing>.removeRecipe(<item:create:crushed_zinc_ore>);
<recipetype:create:crushing>.addRecipe("crushed_zinc_ore", [<item:create:crushed_zinc_ore>, <item:create:crushed_zinc_ore>*2 % 30, <item:minecraft:cobblestone> % 12], <tag:items:forge:ores/zinc>);


<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/gold/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/zinc/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/copper/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/lead/ore");

<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/emerald/ore");

<recipetype:tconstruct:melting>.addOreMeltingRecipe("iron_ore", <item:create:crushed_iron_ore>, <fluid:tconstruct:molten_iron> * 144, 800, 440, [<fluid:tconstruct:molten_copper> * 48]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("gold_ore", <item:create:crushed_gold_ore>, <fluid:tconstruct:molten_gold> * 144, 700, 420, [<fluid:tconstruct:molten_copper> * 48]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("zinc_ore", <item:create:crushed_zinc_ore>, <fluid:tconstruct:molten_zinc> * 144, 420, 340, [<fluid:tconstruct:molten_copper> * 48]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("copper_ore", <item:create:crushed_copper_ore>, <fluid:tconstruct:molten_copper> * 144, 500, 360, [<fluid:tconstruct:molten_gold> * 16]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("lead_ore", <item:create:crushed_lead_ore>, <fluid:tconstruct:molten_lead> * 144, 330, 320, [<fluid:tconstruct:molten_gold> * 48]);

<recipetype:create:filling>.addRecipe("auto_redstone",
    <item:minecraft:redstone>,
    <item:create:cinder_flour>,
    <fluid:tconstruct:blood>*25
);
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("netherrack_casting",
    <item:minecraft:cobblestone>,
    <fluid:tconstruct:blood>*250,
    <item:minecraft:netherrack>,
    60,
    true,
    false
);

// ignitium
var ii = <item:cataclysm:ignitium_ingot>;

<recipetype:create:mechanical_crafting>.addRecipe("ignitium_ingot",
    ii,
    [
        [<item:forbidden_arcanus:arcane_gold_ingot>, <item:forbidden_arcanus:arcane_gold_ingot>, <item:forbidden_arcanus:arcane_gold_ingot>],
        [<item:forbidden_arcanus:arcane_gold_ingot>, <item:mutantmore:mutant_blaze_core>, <item:forbidden_arcanus:arcane_gold_ingot>],
        [<item:forbidden_arcanus:arcane_gold_ingot>, <item:forbidden_arcanus:arcane_gold_ingot>, <item:forbidden_arcanus:arcane_gold_ingot>]
    ]
);
craftingTable.addShapeless("ignitium_ingot_from_block",
    ii*9,
    [<item:cataclysm:ignitium_block>]
);
craftingTable.addShapeless("ignitium_block",
    <item:cataclysm:ignitium_block>,
    [ii,ii,ii,
    ii,ii,ii,
    ii,ii,ii]
);
smithing.addRecipe("ignitium_helmet",
    <item:cataclysm:ignitium_helmet>,
    <item:minecraft:netherite_helmet>,
    ii
);
smithing.addRecipe("ignitium_chestplate",
    <item:cataclysm:ignitium_chestplate>,
    <item:minecraft:netherite_chestplate>,
    ii
);
smithing.addRecipe("ignitium_leggings",
    <item:cataclysm:ignitium_leggings>,
    <item:minecraft:netherite_leggings>,
    ii
);
smithing.addRecipe("ignitium_boots",
    <item:cataclysm:ignitium_boots>,
    <item:minecraft:netherite_boots>,
    ii
);

var orangeTextColor = new MCStyle().setColor(14246400);

<item:cataclysm:ignitium_helmet>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.armor.ignitium").setStyle(orangeTextColor));
<item:cataclysm:ignitium_chestplate>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.armor.ignitium").setStyle(orangeTextColor));
<item:cataclysm:ignitium_leggings>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.armor.ignitium").setStyle(orangeTextColor));
<item:cataclysm:ignitium_boots>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.armor.ignitium").setStyle(orangeTextColor));


// Grappling hook
craftingTable.removeRecipe(<item:grapplemod:baseupgradeitem>);
craftingTable.addShaped("grappling_upgrade",
    <item:grapplemod:baseupgradeitem>,
    [
        [_, <tag:items:forge:ingots/silicon_bronze>, _],
        [<tag:items:forge:ingots/silicon_bronze>, <item:storagedrawers:upgrade_template>, <tag:items:forge:ingots/silicon_bronze>],
        [_, <tag:items:minecraft:planks>, _]
    ]
);
craftingTable.removeRecipe(<item:grapplemod:block_grapple_modifier>);

craftingTable.removeRecipe(<item:simpleplanes:plane_workbench>);
craftingTable.addShapedMirrored("plane_workbench",
    <item:simpleplanes:plane_workbench>,
    [
        [<item:minecraft:iron_axe>, <tag:items:forge:plates/iron>, <item:simpleplanes:wrench>],
        [<tag:items:forge:rods/iron>, <item:create:refined_radiance_casing>, <tag:items:forge:rods/iron>],
        [<tag:items:forge:rods/iron>, <item:minecraft:crafting_table>, <tag:items:forge:rods/iron>]
    ]
);
craftingTable.removeRecipe(<item:simpleplanes:charging_station>);
craftingTable.addShapedMirrored("plane_charging_station",
    <item:simpleplanes:charging_station>,
    [
        [<tag:items:forge:ingots/cobalt>, <item:minecraft:light_weighted_pressure_plate>, <tag:items:forge:ingots/cobalt>],
        [<tag:items:forge:rods/gold>, <item:createaddition:overcharged_casing>, <tag:items:forge:rods/gold>],
        [<tag:items:forge:ingots/cobalt>, <tag:items:forge:dusts/redstone>, <tag:items:forge:ingots/cobalt>]
    ]
);
craftingTable.removeRecipe(<item:simpleplanes:electric_engine>);
craftingTable.addShaped("plane_electric_engine",
    <item:simpleplanes:electric_engine>,
    [
        [<tag:items:forge:ingots/cobalt>, <item:minecraft:light_weighted_pressure_plate>, <tag:items:forge:ingots/cobalt>],
        [<item:createaddition:electric_motor>, <item:createaddition:overcharged_casing>, <item:createaddition:electric_motor>],
        [<tag:items:forge:plates/iron>, <tag:items:forge:plates/iron>, <tag:items:forge:plates/iron>]
    ]
);

// knuckles
craftingTable.removeRecipe(<item:curios:knuckles>);
craftingTable.addShapedMirrored("brass_knuckles",
    <item:curios:knuckles>,
    [
        [_, <tag:items:forge:nuggets/brass>, _],
        [<tag:items:forge:ingots/brass>, <item:alexsmobs:guster_eye>, <tag:items:forge:nuggets/brass>],
        [_, <tag:items:forge:ingots/brass>, _]
    ]

);
// explorer's compass
craftingTable.removeRecipe(<item:explorerscompass:explorerscompass>);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("explorers_compass")
    .transitionTo(<item:minecraft:compass>)
    .require(<tag:items:forge:ingots/redstone_gold>)
    .loops(1)
    .addOutput(<item:explorerscompass:explorerscompass>, 1)
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:betterendforge:eternal_crystal>))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:tconstruct:ender_slime> * 250))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:mowziesmobs:ice_crystal>))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:minecraft:shulker_shell>))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:eidolon:unholy_symbol>))
);

// vanillatweaks inspired recipes
craftingTable.addShaped("better_chests",
    <item:minecraft:chest>*4,
    [
        [<tag:items:minecraft:logs>,<tag:items:minecraft:logs>,<tag:items:minecraft:logs>],
        [<tag:items:minecraft:logs>,_,<tag:items:minecraft:logs>],
        [<tag:items:minecraft:logs>,<tag:items:minecraft:logs>,<tag:items:minecraft:logs>]
    ]
);
craftingTable.addShaped("better_repeater",
    <item:minecraft:repeater>,
    [
        [<item:minecraft:redstone>, _, <item:minecraft:redstone>],
        [<tag:items:forge:rods/wooden>, <item:minecraft:redstone>, <tag:items:forge:rods/wooden>],
        [<item:minecraft:stone>,<item:minecraft:stone>,<item:minecraft:stone>]
    ]
);

craftingTable.removeRecipe(<item:magicfeather:magicfeather>);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("magic_feather")
    .transitionTo(<item:minecraft:feather>)
    .require(<tag:items:forge:elytra>)
    .loops(1)
    .addOutput(<item:magicfeather:magicfeather>, 1)
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<tag:items:forge:shears>))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:minecraft:shulker_shell>))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:tconstruct:molten_glass> * 250))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:forbidden_arcanus:golden_feather>))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:eidolon:unholy_symbol>))
);

mods.jei.JEI.addItem(<item:tconstruct:soulsteel_nugget>);
mods.jei.JEI.addItem(<item:tconstruct:soulsteel_ingot>);
mods.jei.JEI.addItem(<item:tconstruct:soulsteel_block>);
craftingTable.addShapeless("soulsteel_block_from_ingots",
    <item:tconstruct:soulsteel_block>,
    [
        <item:tconstruct:soulsteel_ingot>, <item:tconstruct:soulsteel_ingot>, <item:tconstruct:soulsteel_ingot>,
        <item:tconstruct:soulsteel_ingot>, <item:tconstruct:soulsteel_ingot>, <item:tconstruct:soulsteel_ingot>,
        <item:tconstruct:soulsteel_ingot>, <item:tconstruct:soulsteel_ingot>, <item:tconstruct:soulsteel_ingot>

    ]
);
craftingTable.addShapeless("soulsteel_ingot_from_nuggets",
    <item:tconstruct:soulsteel_ingot>,
    [
        <item:tconstruct:soulsteel_nugget>, <item:tconstruct:soulsteel_nugget>, <item:tconstruct:soulsteel_nugget>,
        <item:tconstruct:soulsteel_nugget>, <item:tconstruct:soulsteel_nugget>, <item:tconstruct:soulsteel_nugget>,
        <item:tconstruct:soulsteel_nugget>, <item:tconstruct:soulsteel_nugget>, <item:tconstruct:soulsteel_nugget>

    ]
);

craftingTable.addShapeless("soulsteel_ingots_from_block",
    <item:tconstruct:soulsteel_ingot>*9,
    [
        <item:tconstruct:soulsteel_block>
    ]
);
craftingTable.addShapeless("soulsteel_nuggets_from_ingot",
    <item:tconstruct:soulsteel_nugget>*9,
    [
        <item:tconstruct:soulsteel_ingot>
    ]
);

<recipetype:create:mechanical_crafting>.addRecipe("soulsteel_ingots_from_block_mech",
    <item:tconstruct:soulsteel_ingot>*9,
    [[
        <item:tconstruct:soulsteel_block>
    ]]
);
<recipetype:create:mechanical_crafting>.addRecipe("soulsteel_nuggets_from_ingot_mech",
    <item:tconstruct:soulsteel_nugget>*9,
    [[
        <item:tconstruct:soulsteel_ingot>
    ]]
);

craftingTable.removeRecipe(<item:minecraft:crossbow>);
craftingTable.addShaped("crossbow",
    <item:minecraft:crossbow>,
    [
        [<item:minecraft:stick>, <item:create:brass_ingot>, <item:minecraft:stick>],
        [<item:minecraft:string>, <item:minecraft:tripwire_hook>, <item:minecraft:string>],
        [<item:minecraft:air>, <item:minecraft:string>, <item:minecraft:air>]
    ]
);

AITweaks.addAttackNearestTweak(<entitytype:kobolds:kobold_pirate>, <entitytype:minecraft:player>, 2, true);

// craftingTable.addShapedMirrored("soaring_helmet",
//     <item:minecraft:diamond_helmet>.withTag({RepairCost: 20 as int, AttributeModifiers: [{Amount: 1 as int, Slot: "head" as string, AttributeName: "generic.max_health" as string, Operation: 0 as int, UUID: [406908201, 698699477, -1315920193, 1024514078], Name: "generic.max_health" as string}, {Amount: 1 as int, Slot: "head" as string, AttributeName: "generic.luck" as string, Operation: 0 as int, UUID: [846493083, -1326429731, -1723277641, -1733768700], Name: "generic.luck" as string}, {Amount: 3 as int, Slot: "head" as string, AttributeName: "generic.armor" as string, Operation: 0 as int, UUID: [1971215365, -1098363312, -1695515322, -417499965], Name: "generic.armor" as string}, {Amount: 2.5 as double, Slot: "head" as string, AttributeName: "generic.armor_toughness" as string, Operation: 0 as int, UUID: [252407515, -1866905082, -1663024550, -1621122407], Name: "generic.armor_toughness" as string}], display: {Name: "{\"translate\":\"item.soaring_depths.helmet\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}" as string}}),
//     [
//         [<item:forbidden_arcanus:rune>, <item:rubber_duck:rubber_duck_item>, <item:forbidden_arcanus:rune>],
//         [<item:minecraft:pumpkin>, <item:minecraft:diamond_helmet>, <item:minecraft:melon>],
//         [<item:forbidden_arcanus:rune>, <item:minecraft:cake>, <item:forbidden_arcanus:rune>]
//     ]
// );
// craftingTable.addShapedMirrored("soaring_chestplate",
//     <item:minecraft:diamond_chestplate>.withTag({RepairCost: 20 as int, AttributeModifiers: [{Amount: 1 as int, Slot: "chest" as string, AttributeName: "generic.max_health" as string, Operation: 0 as int, UUID: [-1711147710, 786318086, -1840061360, -700988552], Name: "generic.max_health" as string}, {Amount: 0.05 as double, Slot: "chest" as string, AttributeName: "generic.attack_damage" as string, Operation: 1 as int, UUID: [1803469936, 2112506557, -1238374156, 1022883948], Name: "generic.attack_damage" as string}, {Amount: 8 as int, Slot: "chest" as string, AttributeName: "generic.armor" as string, Operation: 0 as int, UUID: [1946251339, -1752282237, -1631011045, 1659140540], Name: "generic.armor" as string}, {Amount: 2.5 as double, Slot: "chest" as string, AttributeName: "generic.armor_toughness" as string, Operation: 0 as int, UUID: [-2012540783, -350993202, -1974823836, -1574826634], Name: "generic.armor_toughness" as string}], display: {Name: "{\"translate\":\"item.soaring_depths.chestplate\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}" as string}}),
//     [
//         [<item:forbidden_arcanus:rune>, <item:rubber_duck:rubber_duck_item>, <item:forbidden_arcanus:rune>],
//         [<item:minecraft:pumpkin>, <item:minecraft:diamond_chestplate>, <item:minecraft:melon>],
//         [<item:forbidden_arcanus:rune>, <item:minecraft:cake>, <item:forbidden_arcanus:rune>]
//     ]
// );
// craftingTable.addShapedMirrored("soaring_leggings",
//     <item:minecraft:diamond_leggings>.withTag({RepairCost: 20 as int, AttributeModifiers: [{Amount: 1 as int, Slot: "legs" as string, AttributeName: "generic.max_health" as string, Operation: 0 as int, UUID: [1431361478, 2086225764, -1087738565, 241505510], Name: "generic.max_health" as string}, {Amount: 0.05 as double, Slot: "legs" as string, AttributeName: "generic.attack_speed" as string, Operation: 1 as int, UUID: [-2117892232, 158223464, -1125369066, 807726405], Name: "generic.attack_speed" as string}, {Amount: 6 as int, Slot: "legs" as string, AttributeName: "generic.armor" as string, Operation: 0 as int, UUID: [857608069, 1326596829, -1463633432, 728321353], Name: "generic.armor" as string}, {Amount: 2.5 as double, Slot: "legs" as string, AttributeName: "generic.armor_toughness" as string, Operation: 0 as int, UUID: [19210898, -950383499, -1810796246, 834679468], Name: "generic.armor_toughness" as string}], display: {Name: "{\"translate\":\"item.soaring_depths.leggings\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}" as string}}),
//     [
//         [<item:forbidden_arcanus:rune>, <item:rubber_duck:rubber_duck_item>, <item:forbidden_arcanus:rune>],
//         [<item:minecraft:pumpkin>, <item:minecraft:diamond_leggings>, <item:minecraft:melon>],
//         [<item:forbidden_arcanus:rune>, <item:minecraft:cake>, <item:forbidden_arcanus:rune>]
//     ]
// );
// craftingTable.addShapedMirrored("soaring_boots",
//     <item:minecraft:diamond_boots>.withTag({RepairCost: 20 as int, AttributeModifiers: [{Amount: 1 as int, Slot: "feet" as string, AttributeName: "generic.max_health" as string, Operation: 0 as int, UUID: [1080058058, -336311468, -1187948974, 1922209595], Name: "generic.max_health" as string}, {Amount: 0.05 as double, Slot: "feet" as string, AttributeName: "generic.movement_speed" as string, Operation: 1 as int, UUID: [943163541, -1239594384, -1553889467, -969823642], Name: "generic.movement_speed" as string}, {Amount: 3 as int, Slot: "feet" as string, AttributeName: "generic.armor" as string, Operation: 0 as int, UUID: [-888540306, -2113581502, -2031968599, 1451642743], Name: "generic.armor" as string}, {Amount: 2.5 as double, Slot: "feet" as string, AttributeName: "generic.armor_toughness" as string, Operation: 0 as int, UUID: [1955887886, -361281188, -1546569180, -333968879], Name: "generic.armor_toughness" as string}], display: {Name: "{\"translate\":\"item.soaring_depths.boots\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}" as string}}),
//     [
//         [<item:forbidden_arcanus:rune>, <item:rubber_duck:rubber_duck_item>, <item:forbidden_arcanus:rune>],
//         [<item:minecraft:pumpkin>, <item:minecraft:diamond_boots>, <item:minecraft:melon>],
//         [<item:forbidden_arcanus:rune>, <item:minecraft:cake>, <item:forbidden_arcanus:rune>]
//     ]
// );

