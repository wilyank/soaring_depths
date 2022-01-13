#priority 100

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.MCItemDefinition;
import stdlib.List;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.util.text.MCStyle;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.server.MCServer;

// this scripts does random tweaks and fixes

// oredictionary fixes
var forge_gems = <tag:items:forge:gems>;
forge_gems.add(<item:biomesoplenty:nether_crystal>);
forge_gems.add(<item:betterendforge:amber_gem>);
forge_gems.add(<item:astralsorcery:resonating_gem>);
forge_gems.add(<item:eidolon:lesser_soul_gem>);
forge_gems.add(<item:eidolon:shadow_gem>);
forge_gems.add(<item:bloodmagic:lavacrystal>);

<tag:items:forge:lanterns>.add(<item:minecraft:lantern>);
<tag:items:forge:lanterns>.add(<item:minecraft:soul_lantern>);
<tag:items:forge:lanterns>.add(<item:infernalexp:glow_lantern>);
<tag:items:forge:lanterns>.add(<item:endergetic:ender_lantern>);
<tag:items:forge:lanterns>.add(<item:tconstruct:scorched_lantern>);
<tag:items:forge:lanterns>.add(<item:tconstruct:seared_lantern>);

<tag:items:forge:cogwheels>.add(<item:steampowered:bronze_cogwheel>);
<tag:items:forge:cogwheels>.add(<item:steampowered:cast_iron_cogwheel>);
<tag:items:forge:cogwheels>.add(<item:steampowered:steel_cogwheel>);
<tag:items:forge:large_cogwheels>.add(<item:steampowered:bronze_large_cogwheel>);
<tag:items:forge:large_cogwheels>.add(<item:steampowered:bronze_large_cogwheel>);
<tag:items:forge:large_cogwheels>.add(<item:steampowered:steel_large_cogwheel>);

<tag:items:forge:leather>.remove(<item:forbidden_arcanus:rotten_leather>);

// remove distracting item filters
mods.jei.JEI.hideMod("itemfilters");


// fix Eidolon and Forbidden and Arcanus having wildly different ingots with the same name. Renaming is done in the lang files
<tag:items:forge:ingots/arcane_gold>.remove(<item:eidolon:arcane_gold_ingot>);
<tag:items:forge:ingots/redstone_gold>.add(<item:eidolon:arcane_gold_ingot>);

var _ = <item:minecraft:air>;

// end portal
craftingTable.removeRecipe(<item:minecraft:end_portal_frame>);
craftingTable.addShaped("end_portal_frame", 
    <item:minecraft:end_portal_frame>*3, 
    [
        [_, <item:create:shadow_steel>, _],
        [<item:eidolon:shadow_gem>,<item:forbidden_arcanus:end_crystal_gem>, <item:eidolon:shadow_gem>], 
        [<item:infernalexp:glowstone_bricks>, <item:create:refined_radiance>, <item:infernalexp:glowstone_bricks>]
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

// make soul sand and liquid soul automatable
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("sand_to_soul_sand", 
    <item:minecraft:sand>, 
    <fluid:tconstruct:blood> * 250, 
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
    [<item:minecraft:diorite>, <item:create:limesand>]
);

craftingTable.removeRecipe(<item:minecraft:granite>);
craftingTable.addShapeless("granite",
    <item:minecraft:granite>,
    [<item:minecraft:cobblestone>,<item:create:cinder_flour>]
);
<recipetype:create:mixing>.addRecipe("granite_mixing",
    "none",
    <item:minecraft:granite>,
    [<item:minecraft:cobblestone>,<item:create:cinder_flour>]
);
<recipetype:tconstruct:casting_basin>.removeByName("tconstruct:smeltery/casting/quartz/granite");
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("casting_granite",
    <item:minecraft:cobblestone>,
    <fluid:tconstruct:molten_iron>*4,
    <item:minecraft:granite>,
    10,
    true,
    false
);

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

// ore hiding and descriptions
mods.jei.JEI.hideIngredient(<item:tconstruct:copper_ore>);
if (loadedMods.isModLoaded("jeresources")) {
    mods.jei.JEI.hideCategory("jeresources:worldgen");
}
var style = new MCStyle;
style.setFormatting(<formatting:gray>);
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

// Force using alloying or mixing for making pewter
craftingTable.removeRecipe(<item:eidolon:pewter_blend>);
furnace.removeRecipe(<item:eidolon:pewter_ingot>);
blastFurnace.removeRecipe(<item:eidolon:pewter_ingot>);

<recipetype:create:mixing>.addRecipe("pewter_mixing",
    "heated",
    <item:eidolon:pewter_ingot>*2,
    [<tag:items:forge:ingots/iron>, <tag:items:forge:ingots/lead>]
);

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

<recipetype:create:filling>.addRecipe("brass_casing",
    <item:create:brass_casing>,
    <tag:items:minecraft:logs>,
    <fluid:tconstruct:molten_brass>*144  
);

craftingTable.removeRecipe(<item:create:deployer>);
craftingTable.addShaped("deployer",
    <item:create:deployer>,
    [
        [_, <tag:items:forge:cogwheels>, _],
        [<tag:items:forge:cogwheels>, <item:create:brass_casing>, <tag:items:forge:cogwheels>],
        [_, <item:create:brass_hand>, _]
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

<recipetype:create:crushing>.addRecipe("crushed_arcane_crystal", [<item:forbidden_arcanus:arcane_crystal>, <item:forbidden_arcanus:arcane_crystal>%20], <item:forbidden_arcanus:arcane_crystal_ore>);
<recipetype:create:crushing>.addRecipe("crushed_arcane_crystal_dust", [<item:forbidden_arcanus:arcane_crystal_dust>, <item:forbidden_arcanus:arcane_crystal_dust>%10], <item:forbidden_arcanus:arcane_crystal>);

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
    <fluid:tconstruct:magma>*250,
    <item:minecraft:netherrack>,
    60,
    true,
    false
);

// ignitium
var ii = <item:cataclysm:ignitium_ingot>;

craftingTable.addShaped("ignitium_ingot",
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
