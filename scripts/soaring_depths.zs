#priority 99

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.MCItemDefinition;
import stdlib.List;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;
import crafttweaker.api.entity.AttributeOperation;

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

// make turtle eggs obtainable
villagerTrades.addWanderingTrade(1, <item:minecraft:diamond>, <item:minecraft:turtle_egg>, 4, 2);


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

// remove a weird crafting recipe that should have never existed
furnace.removeByName("charcoalblock:charcoal_block_smelting");

var crushed_starmetal_ore = <item:contenttweaker:crushed_starmetal_ore>;
var starmetal_nugget = <item:contenttweaker:starmetal_nugget>;
mods.jei.JEI.addItem(crushed_starmetal_ore);
mods.jei.JEI.addItem(starmetal_nugget);


<recipetype:create:crushing>.addRecipe("crushed_arcane_crystal", 
    [
        <item:forbidden_arcanus:arcane_crystal>, 
        <item:forbidden_arcanus:arcane_crystal>%20
    ], 
    <item:forbidden_arcanus:arcane_crystal_ore>
);
<recipetype:create:crushing>.addRecipe("crushed_arcane_crystal_dust_crushing", 
    [
        <item:forbidden_arcanus:arcane_crystal_dust>, 
        <item:forbidden_arcanus:arcane_crystal_dust>%10
    ], 
    <item:forbidden_arcanus:arcane_crystal>
);
<recipetype:create:milling>.addRecipe("crushed_arcane_crystal_dust_milling", 
    [
        <item:forbidden_arcanus:arcane_crystal_dust>, 
        <item:forbidden_arcanus:arcane_crystal_dust>%10
    ], 
    <item:forbidden_arcanus:arcane_crystal>
);

<recipetype:create:crushing>.removeRecipe(<item:create:crushed_copper_ore>);
<recipetype:create:crushing>.addRecipe("crushed_copper_ore", 
    [
        <item:create:crushed_copper_ore>, 
        <item:create:crushed_copper_ore>*2 % 30, 
        <item:minecraft:cobblestone> % 12
    ], 
    <tag:items:forge:ores/copper>
);
<recipetype:create:crushing>.removeRecipe(<item:create:crushed_zinc_ore>);
<recipetype:create:crushing>.addRecipe("crushed_zinc_ore", 
    [
        <item:create:crushed_zinc_ore>, 
        <item:create:crushed_zinc_ore>*2 % 30, 
        <item:minecraft:cobblestone> % 12
    ],
    <tag:items:forge:ores/zinc>
);

<recipetype:create:crushing>.addRecipe("crushed_starmetal_ore", 
    [
        crushed_starmetal_ore, 
        crushed_starmetal_ore*2 % 30, 
        <item:minecraft:cobblestone> % 12
    ], 
    <item:astralsorcery:starmetal_ore>
);
furnace.addRecipe("smelting_crushed_starmetal_ore", <item:astralsorcery:starmetal_ingot>, crushed_starmetal_ore, 0.1, 200);
blastFurnace.addRecipe("blasting_crushed_starmetal_ore", <item:astralsorcery:starmetal_ingot>, crushed_starmetal_ore, 0.1, 100);

<recipetype:create:splashing>.addRecipe("splashing_crushed_starmetal_ore", 
    [
        starmetal_nugget*10, 
        starmetal_nugget*5 % 50
    ], 
    crushed_starmetal_ore
);

craftingTable.addShapeless("starmetal_ingot_to_nugget",
    <item:astralsorcery:starmetal_ingot>,
    [
        starmetal_nugget, starmetal_nugget, starmetal_nugget,
        starmetal_nugget, starmetal_nugget, starmetal_nugget,
        starmetal_nugget, starmetal_nugget, starmetal_nugget
    ]
);
craftingTable.addShapeless("starmetal_nugget_to_ingot",
    starmetal_nugget*9,
    [
        <item:astralsorcery:starmetal_ingot>
    ]
);
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("starmetal_nugget_casting",
    <tag:items:tconstruct:casts/multi_use/nugget>,
    <fluid:materialis:molten_starmetal>*16,
    starmetal_nugget,
    1,
    false,
    false
);
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("starmetal_nugget_sand_casting",
    <tag:items:tconstruct:casts/single_use/nugget>,
    <fluid:materialis:molten_starmetal>*16,
    starmetal_nugget,
    1,
    true,
    false
);

<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/gold/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/zinc/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/copper/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/lead/ore");

<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/diamond/ore");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/emerald/ore");

<recipetype:tconstruct:melting>.removeByName("materialis:smeltery/melting/metal/starmetal/ore");


<recipetype:tconstruct:melting>.addOreMeltingRecipe("iron_ore", <item:create:crushed_iron_ore>, <fluid:tconstruct:molten_iron> * 144, 800, 440, [<fluid:tconstruct:molten_copper> * 48]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("gold_ore", <item:create:crushed_gold_ore>, <fluid:tconstruct:molten_gold> * 144, 700, 420, [<fluid:tconstruct:molten_copper> * 48]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("zinc_ore", <item:create:crushed_zinc_ore>, <fluid:tconstruct:molten_zinc> * 144, 420, 340, [<fluid:tconstruct:molten_copper> * 48]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("copper_ore", <item:create:crushed_copper_ore>, <fluid:tconstruct:molten_copper> * 144, 500, 360, [<fluid:tconstruct:molten_gold> * 16]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("lead_ore", <item:create:crushed_lead_ore>, <fluid:tconstruct:molten_lead> * 144, 330, 320, [<fluid:tconstruct:molten_gold> * 48]);
<recipetype:tconstruct:melting>.addOreMeltingRecipe("starmetal_ore", crushed_starmetal_ore, <fluid:materialis:molten_starmetal> * 144, 750, 440, [<fluid:astralsorcery:liquid_starlight> * 100]);

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
    .require(<tag:items:forge:ingots/red_gold>)
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
<recipetype:create:crushing>.addRecipe("crushing_ender_ore", [<item:betterendforge:ender_shard>, <item:betterendforge:ender_shard> % 50], <item:betterendforge:ender_ore>);
<recipetype:create:milling>.addRecipe("milling_ender_ore", [<item:betterendforge:ender_shard>, <item:betterendforge:ender_shard> % 50], <item:betterendforge:ender_ore>);
<recipetype:create:milling>.addRecipe("milling_ender_dust", [<item:betterendforge:ender_dust>, <item:betterendforge:ender_dust> % 5], <item:betterendforge:ender_shard>);

<recipetype:create:crushing>.addRecipe("crushing_amber_ore", [<item:betterendforge:raw_amber>, <item:betterendforge:raw_amber> % 50], <item:betterendforge:amber_ore>);
<recipetype:create:milling>.addRecipe("milling_amber_ore", [<item:betterendforge:raw_amber>, <item:betterendforge:raw_amber> % 50], <item:betterendforge:amber_ore>);

<recipetype:create:milling>.addRecipe("milling_gravel", [<item:minecraft:sand>, <item:minecraft:flint> % 10, <item:minecraft:clay_ball> % 5], <item:minecraft:gravel>);


AITweaks.addAttackNearestTweak(<entitytype:kobolds:kobold_pirate>, <entitytype:minecraft:player>, 2, true);

// Armor overhaul

craftingTable.removeRecipe(<item:forbidden_arcanus:tyr_helmet>);
craftingTable.removeRecipe(<item:forbidden_arcanus:tyr_chestplate>);
craftingTable.removeRecipe(<item:forbidden_arcanus:tyr_leggings>);
craftingTable.removeRecipe(<item:forbidden_arcanus:tyr_boots>);

<recipetype:tconstruct:entity_melting>.addRecipe("spider_pig_melting", 
    <entitytype:mutantbeasts:spider_pig>, 
    <fluid:contenttweaker:spider_pig_essence>, 
    1
);
<recipetype:tconstruct:entity_melting>.addRecipe("mutant_creeper_melting", 
    <entitytype:mutantbeasts:mutant_creeper>, 
    <fluid:contenttweaker:creeper_essence>, 
    1
);
<recipetype:tconstruct:entity_melting>.addRecipe("mutant_skeleton_melting", 
    <entitytype:mutantbeasts:mutant_skeleton>, 
    <fluid:contenttweaker:skeleton_essence>, 
    1
);
<recipetype:tconstruct:entity_melting>.addRecipe("mutant_enderman_melting", 
    <entitytype:mutantbeasts:mutant_enderman>, 
    <fluid:contenttweaker:enderman_essence>, 
    1
);
<recipetype:tconstruct:entity_melting>.addRecipe("mutant_wither_skeleton_melting", 
    <entitytype:mutantmore:mutant_wither_skeleton>, 
    <fluid:contenttweaker:wither_skeleton_essence>, 
    1
);
<recipetype:tconstruct:entity_melting>.addRecipe("mutant_hoglin_melting", 
    <entitytype:mutantmore:mutant_hoglin>, 
    <fluid:contenttweaker:hoglin_essence>, 
    1
);
<recipetype:tconstruct:entity_melting>.addRecipe("void_worm_melting", 
    <entitytype:alexsmobs:void_worm>, 
    <fluid:contenttweaker:void_worm_essence>, 
    1
);

<recipetype:tconstruct:alloying>.addRecipe("mob_essence_alloy", 
    [
        <fluid:contenttweaker:skeleton_essence>*1000,
        <fluid:contenttweaker:creeper_essence>*1000,
        <fluid:contenttweaker:enderman_essence>*1000,
        <fluid:contenttweaker:hoglin_essence>*1000,
        <fluid:contenttweaker:wither_skeleton_essence>*1000,
        <fluid:contenttweaker:void_worm_essence>*1000,
        <fluid:contenttweaker:spider_pig_essence>*1000
    ], 
    <fluid:contenttweaker:mob_essence>*7000,
    1500
);

<recipetype:astralsorcery:infusion>.addRecipe("draco_helmet_to_tyr_helmet", 
    <item:forbidden_arcanus:tyr_helmet>, 
    <item:forbidden_arcanus:draco_arcanus_helmet>, 
    <fluid:contenttweaker:mob_essence>, 
    200, 
    1, 
    true, 
    true, 
    true
);
<recipetype:astralsorcery:infusion>.addRecipe("draco_chestplate_to_tyr_chestplate", 
    <item:forbidden_arcanus:tyr_chestplate>, 
    <item:forbidden_arcanus:draco_arcanus_chestplate>, 
    <fluid:contenttweaker:mob_essence>, 
    200, 
    1, 
    true, 
    true, 
    true
);
<recipetype:astralsorcery:infusion>.addRecipe("draco_leggings_to_tyr_leggings", 
    <item:forbidden_arcanus:tyr_leggings>, 
    <item:forbidden_arcanus:draco_arcanus_leggings>, 
    <fluid:contenttweaker:mob_essence>, 
    200, 
    1, 
    true, 
    true, 
    true
);
<recipetype:astralsorcery:infusion>.addRecipe("draco_boots_to_tyr_boots", 
    <item:forbidden_arcanus:tyr_boots>, 
    <item:forbidden_arcanus:draco_arcanus_boots>, 
    <fluid:contenttweaker:mob_essence>, 
    200, 
    1, 
    true, 
    true, 
    true
);

<recipetype:create:mixing>.addRecipe("origin_orb_mixing",
    "none",
    <item:origins:orb_of_origin>,
    [
        <item:alexsmobs:soul_heart>,
        <item:minecraft:rotten_flesh>,
        <item:minecraft:porkchop>,
        <item:kobolds:kobold_block_skull>,
        <item:minecraft:ender_pearl>,
        <item:forbidden_arcanus:eternal_stella>
    ],
    [
        <fluid:contenttweaker:mob_essence>*1000
    ]
);

# do some global attribute modifier magic to 'fix' armor protection values

<item:minecraft:leather_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 1, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:leather_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:leather_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:leather_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 1, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:minecraft:chainmail_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:chainmail_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:chainmail_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:chainmail_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 1, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:minecraft:golden_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:golden_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:golden_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:golden_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:minecraft:iron_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:iron_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 3, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:iron_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:iron_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:minecraft:turtle_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);

<item:minecraft:diamond_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:diamond_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 4.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:diamond_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 4, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:diamond_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:minecraft:diamond_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:diamond_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:diamond_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:diamond_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);


<item:minecraft:netherite_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 3.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:netherite_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 5.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:netherite_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 4.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:netherite_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:minecraft:netherite_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:minecraft:netherite_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:minecraft:netherite_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:minecraft:netherite_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:betterendforge:thallasium_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:betterendforge:thallasium_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 3.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:betterendforge:thallasium_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 3, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:betterendforge:thallasium_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:betterendforge:terminite_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:betterendforge:terminite_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 4, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:betterendforge:terminite_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 3.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:betterendforge:terminite_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:betterendforge:crystalite_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 3, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:betterendforge:crystalite_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:betterendforge:crystalite_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 4, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:betterendforge:crystalite_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);
<item:betterendforge:crystalite_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:betterendforge:crystalite_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:betterendforge:crystalite_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:betterendforge:crystalite_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:betterendforge:aeternium_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 3.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:betterendforge:aeternium_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 6, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:betterendforge:aeternium_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:betterendforge:aeternium_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 3, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);
<item:betterendforge:aeternium_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:betterendforge:aeternium_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:betterendforge:aeternium_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:betterendforge:aeternium_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:alexsmobs:frontier_cap>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 1, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:alexsmobs:spiked_turtle_shell>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:head>]);

<item:alexsmobs:crocodile_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 4, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:alexsmobs:crocodile_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);

<item:alexsmobs:emu_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 0, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:alexsmobs:emu_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);

<item:alexsmobs:centipede_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 3, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);

<item:alexsmobs:roadrunner_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);


<item:cataclysm:ignitium_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 3.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:cataclysm:ignitium_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 6, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:cataclysm:ignitium_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:cataclysm:ignitium_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 3, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);
<item:cataclysm:ignitium_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:cataclysm:ignitium_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:cataclysm:ignitium_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:cataclysm:ignitium_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:eidolon:warlock_hat>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:eidolon:warlock_cloak>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:eidolon:warlock_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:forbidden_arcanus:mortem_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 0.5, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:mortem_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:mortem_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 1, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:mortem_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 0.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:forbidden_arcanus:arcane_gold_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 1, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:arcane_gold_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 2, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:arcane_gold_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 1.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:arcane_gold_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 1, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);
<item:forbidden_arcanus:arcane_gold_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:arcane_gold_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:arcane_gold_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:arcane_gold_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 1, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);


<item:forbidden_arcanus:obsidian_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 0, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:obsidian_shoulder_pads>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armr Modifier", 0, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:obsidian_knee_pads>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 0, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:obsidian_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 0, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);


<item:forbidden_arcanus:draco_arcanus_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 4, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:draco_arcanus_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 6, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:draco_arcanus_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 5.5, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:draco_arcanus_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 3, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);
<item:forbidden_arcanus:draco_arcanus_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 2, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:draco_arcanus_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 2, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:draco_arcanus_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 2, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:draco_arcanus_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 2, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:forbidden_arcanus:tyr_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Modifier", 4, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:tyr_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 6.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:tyr_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Modifier", 6, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:tyr_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Modifier", 3.5, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);
<item:forbidden_arcanus:tyr_helmet>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "2ad3f246-fee1-4e67-b886-69fd380bb150", "Armor Toughness", 3, AttributeOperation.ADDITION, [<equipmentslottype:head>]);
<item:forbidden_arcanus:tyr_chestplate>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Toughness", 3, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
<item:forbidden_arcanus:tyr_leggings>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "d8499b04-0e66-4726-ab29-64469d734e0d", "Armor Toughness", 3, AttributeOperation.ADDITION, [<equipmentslottype:legs>]);
<item:forbidden_arcanus:tyr_boots>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor_toughness>, "845db27c-c624-495f-8c9f-6020a9a58b6b", "Armor Toughness", 3, AttributeOperation.ADDITION, [<equipmentslottype:feet>]);

<item:create:copper_backtank>.addGlobalAttributeModifier(<attribute:minecraft:generic.armor>, "9f3d476d-c118-4544-8365-64846904b48e", "Armor Modifier", 2.5, AttributeOperation.ADDITION, [<equipmentslottype:chest>]);
