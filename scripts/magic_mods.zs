#priority 10

import crafttweaker.api.util.text.MCTextComponent;

craftingTable.addShapedMirrored("polished_wood_stairs",
    <item:eidolon:polished_planks_stairs>,
    [
        [<item:eidolon:polished_planks>,<item:minecraft:air>,<item:minecraft:air>],
        [<item:eidolon:polished_planks>,<item:eidolon:polished_planks>,<item:minecraft:air>],
        [<item:eidolon:polished_planks>,<item:eidolon:polished_planks>,<item:eidolon:polished_planks>]
    ]
);

// Force using alloying or mixing for making pewter
craftingTable.removeRecipe(<item:eidolon:pewter_blend>);
furnace.removeRecipe(<item:eidolon:pewter_ingot>);
blastFurnace.removeRecipe(<item:eidolon:pewter_ingot>);

<recipetype:create:mixing>.addRecipe("heated_pewter_mixing",
    "heated",
    <item:eidolon:pewter_ingot>*2,
    [<tag:items:forge:ingots/iron>, <tag:items:forge:ingots/lead>]
);

<recipetype:create:mixing>.addRecipe("pewter_mixing",
    "none",
    <fluid:tconstruct:molten_pewter>*16,
    [],
    [
        <fluid:tconstruct:molten_iron>*8,
        <fluid:tconstruct:molten_lead>*8
    ]
);

// Astral Sorcery's ores
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("rock_crystal_ore")
    .transitionTo(<item:minecraft:diorite>)
    .require(<tag:items:forge:ores>)
    .loops(1)
    .addOutput(<item:astralsorcery:rock_crystal_ore>, 1)
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:forbidden_arcanus:wet_purifying_soap>))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:minecraft:water>*250))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:tconstruct:molten_pewter>*144))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:eidolon:unholy_symbol>))
);
smithing.addRecipe("unbreakable_symbol", <item:eidolon:unholy_symbol>.withTag({Unbreakable: 1 as byte}), <item:eidolon:unholy_symbol>, <item:minecraft:obsidian>);

// information on how to get xpetrified orb

mods.jei.JEI.addDescription(
    <item:forbidden_arcanus:xpetrified_orb>, 
    MCTextComponent.createTranslationTextComponent("description.soaring_depths.xpetrified_orb")
);
mods.jei.JEI.addDescription(
    <item:forbidden_arcanus:corrupti_dust>, 
    MCTextComponent.createTranslationTextComponent("description.soaring_depths.corrupti_dust")
);
mods.jei.JEI.addDescription(
    <item:forbidden_arcanus:dark_matter>, 
    MCTextComponent.createTranslationTextComponent("description.soaring_depths.dark_matter")
);
// xpetrified ore from xpetrified orb
craftingTable.addShaped("xpetrified_block",
    <item:forbidden_arcanus:xpetrified_ore>,
    [
        [<item:forbidden_arcanus:xpetrified_orb>, <item:forbidden_arcanus:xpetrified_orb>],
        [<item:forbidden_arcanus:xpetrified_orb>, <item:forbidden_arcanus:xpetrified_orb>]
    ]    
);

mods.jei.JEI.addInfo(<item:forbidden_arcanus:arcane_gold_nugget>, ["Can be grown from Golden Orchid Seeds."]);
craftingTable.removeRecipe(<item:forbidden_arcanus:golden_orchid_seeds>);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("golden_orchid_seeds",
    <tag:items:forge:seeds>,
    <fluid:materialis:molten_arcane_gold> * 144, 
    <item:forbidden_arcanus:golden_orchid_seeds>, 
    40, 
    true, 
    false
);
<recipetype:tconstruct:melting>.addMeltingRecipe("golden_orchid_seeds_melting", 
    <item:forbidden_arcanus:golden_orchid_seeds>, 
    <fluid:materialis:molten_arcane_gold>*16, 
    700, 
    80
);

<recipetype:astralsorcery:liquid_interaction>.addRecipe("shulker_liquid_interaction_failed", <item:minecraft:purpur_block>, <fluid:tconstruct:molten_ender>*1000, 100, <fluid:tconstruct:ender_slime>*1000, 100, 95);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("shulker_liquid_interaction_success", <entitytype:minecraft:shulker>, <fluid:tconstruct:molten_ender>*1000, 100, <fluid:tconstruct:ender_slime>*1000, 100, 5);



<recipetype:create:mixing>.addRecipe("dark_scoria",
    "none",
    <item:create:dark_scoria_cobblestone>,
    [
        <item:create:scoria_cobblestone>*8, <item:minecraft:black_dye>
    ]
);
// change Mutant chemical recipes
brewing.removeRecipeByReagent(<item:minecraft:obsidian>);
brewing.removeRecipeByInput(<item:mutantmore:formula_y>);

<recipetype:create:mixing>.addRecipe("chemical_x",
     "superheated", 
     <item:mutantbeasts:chemical_x>,
     [
        <item:forbidden_arcanus:dark_rune>, 
        <item:forbidden_arcanus:xpetrified_orb>,
        <item:eidolon:fungus_sprouts>,
        <item:minecraft:glass_bottle>
    ],
    [
        <fluid:tconstruct:blood> * 250, 
        <fluid:create:potion>.withTag({Bottle: "REGULAR", Potion: "infernalexp:strong_infection"})*250
    ]
);
<recipetype:create:mixing>.addRecipe("formula_y",
     "superheated", 
     <item:mutantmore:formula_y>,
     [
        <item:forbidden_arcanus:dark_rune>, 
        <item:forbidden_arcanus:xpetrified_orb>,
        <item:eidolon:crimson_essence>,
        <item:mutantbeasts:chemical_x>
    ],
    [
        <fluid:tconstruct:molten_diamond> * 16, 
        <fluid:create:potion>.withTag({Bottle: "REGULAR", Potion: "infernalexp:strong_infection"})*250
    ]
);
<recipetype:create:mixing>.addRecipe("compound_z",
     "superheated", 
     <item:mutantmore:compound_z>,
     [
        <item:forbidden_arcanus:dark_rune>, 
        <item:forbidden_arcanus:xpetrified_orb>,
        <item:eidolon:warped_sprouts>,
        <item:mutantmore:formula_y>
    ],
    [
        <fluid:tconstruct:molten_debris> * 16, 
        <fluid:create:potion>.withTag({Bottle: "REGULAR", Potion: "infernalexp:strong_infection"})*250
    ]
);


mods.jei.JEI.addInfo(<item:forbidden_arcanus:dark_runestone>, ["Right click with Jasper Ore on an activated Runic Tenebris Core to obtain"]);
mods.jei.JEI.addInfo(<item:forbidden_arcanus:dark_rune>, ["Right click with a Jasper Gem on an activated Runic Tenebris Core to obtain"]);

mods.jei.JEI.addInfo(<item:forbidden_arcanus:runic_tenebris_frame>, ["Activate with a Dark Nether Star"]);

craftingTable.removeRecipe(<item:forbidden_arcanus:purifying_soap>);
craftingTable.addShapeless("soap",
    <item:forbidden_arcanus:purifying_soap>,
    [
        <tag:items:forge:dusts/arcane_crystal>, 
        <item:forbidden_arcanus:wax>, 
        <tag:items:forge:slimeballs>,
        <tag:items:minecraft:small_flowers>
    ]
);
<recipetype:create:mixing>.addRecipe("mixing_soap",
    "none",
    <item:forbidden_arcanus:purifying_soap>,
    [
        <tag:items:forge:dusts/arcane_crystal>, 
        <item:forbidden_arcanus:wax>, 
        <tag:items:forge:slimeballs>,
        <tag:items:minecraft:small_flowers>
    ]
);
<recipetype:create:filling>.addRecipe("wetting_soap", <item:forbidden_arcanus:wet_purifying_soap>, <item:forbidden_arcanus:purifying_soap>, <fluid:minecraft:water>*250);
mods.jei.JEI.addInfo(<item:forbidden_arcanus:purifying_soap>, ["Becomes wet when in water"]);

<recipetype:astralsorcery:liquid_interaction>.addRecipe("wraith_liquid_interaction_failed", <item:minecraft:gunpowder>, <fluid:astralsorcery:liquid_starlight> * 1000, 100, <fluid:tconstruct:molten_lead> * 1000, 100, 80);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("wraith_liquid_interaction_success", <entityType:eidolon:wraith>, <fluid:astralsorcery:liquid_starlight> * 1000, 100, <fluid:tconstruct:molten_lead> * 1000, 100, 80);

// some help for F&A
<item:forbidden_arcanus:runic_chiseled_polished_darkstone>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.forbidden_arcanus.runic_chiseled_polished_darkstone"));
<item:forbidden_arcanus:shiny_zombie_arm>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.forbidden_arcanus.zombie_arm"));
<item:forbidden_arcanus:zombie_arm>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.forbidden_arcanus.zombie_arm"));

// add information that crystal lens does not work
<item:astralsorcery:lens>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.astralsorcery.lens"));
mods.jei.JEI.addDescription(<item:astralsorcery:lens>, MCTextComponent.createTranslationTextComponent("description.astralsorcery.lens"));
// obsidian skull
craftingTable.removeRecipe(<item:forbidden_arcanus:obsidian_skull>);
<recipetype:astralsorcery:infusion>.addRecipe("obsidian_skull", 
    <item:forbidden_arcanus:obsidian_skull>, 
    <item:minecraft:skeleton_skull>, 
    <fluid:tconstruct:molten_obsidian>, 
    200, 
    1, 
    true, 
    true, 
    false
);

// construction wands
craftingTable.removeRecipe(<item:constructionwand:stone_wand>);
mods.jei.JEI.hideIngredient(<item:constructionwand:stone_wand>);

craftingTable.removeRecipe(<item:forbidden_arcanus:dark_nether_star>);
<recipetype:astralsorcery:infusion>.addRecipe("dark_nether_star", 
    <item:forbidden_arcanus:dark_nether_star>, 
    <item:minecraft:nether_star>, 
    <fluid:tconstruct:molten_obsidian>, 
    200, 
    1, 
    true, 
    true, 
    false
);

craftingTable.removeRecipe(<item:constructionwand:infinity_wand>);
craftingTable.addShaped("infinity_wand",
    <item:constructionwand:infinity_wand>,
    [
        [<item:minecraft:air>,<item:minecraft:air>,<item:forbidden_arcanus:dark_nether_star>],
        [<item:minecraft:air>, <item:tconstruct:tough_handle>.withTag({Material: "tconstruct:hepatizon" as string}), <item:minecraft:air>],
        [<item:tconstruct:tool_handle>.withTag({Material: "tconstruct:lead" as string}), <item:minecraft:air>, <item:minecraft:air>]
    ]
);

// spectral eye amulet
craftingTable.removeRecipe(<item:forbidden_arcanus:spectral_eye_amulet>);
craftingTable.addShaped("spectral_eye_amulet",
    <item:forbidden_arcanus:spectral_eye_amulet>,
    [
        [<item:minecraft:air>, <item:minecraft:nether_star>, <item:minecraft:air>],
        [<item:forbidden_arcanus:arcane_gold_ingot>, <item:eidolon:basic_amulet>, <item:forbidden_arcanus:arcane_gold_ingot>],
        [<item:minecraft:air>, <item:minecraft:ender_eye>, <item:minecraft:air>]
    ]
);

// crying obsidian
<item:minecraft:crying_obsidian>.addTooltip(MCTextComponent.createTranslationTextComponent("tooltip.soaring_depths.crying_obsidian"));
<recipetype:create:mixing>.addRecipe("crying_obsidian",
    "none",
    <item:minecraft:crying_obsidian>,
    [
        <item:forbidden_arcanus:rune>
    ],
    [
        <fluid:tconstruct:molten_obsidian>*1000, 
        <fluid:astralsorcery:liquid_starlight>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("crying_rune",
    "superheated",
    <item:forbidden_arcanus:rune>,
    [
        <item:minecraft:crying_obsidian>
    ],
    [
        <fluid:tconstruct:venom>*1000
    ]
);

craftingTable.removeRecipe(<item:forbidden_arcanus:golden_feather>);
craftingTable.addShaped("golden_feather",
    <item:forbidden_arcanus:golden_feather>,
    [
        [<item:forbidden_arcanus:arcane_gold_nugget>,<item:forbidden_arcanus:arcane_gold_nugget>,<item:forbidden_arcanus:arcane_gold_nugget>],
        [<item:forbidden_arcanus:arcane_gold_nugget>,<item:minecraft:feather>,<item:forbidden_arcanus:arcane_gold_nugget>],
        [<item:forbidden_arcanus:arcane_gold_nugget>,<item:forbidden_arcanus:arcane_gold_nugget>,<item:forbidden_arcanus:arcane_gold_nugget>]
    ]
);
<recipetype:create:mixing>.addRecipe("golden_feather",
    "none",
    <item:forbidden_arcanus:golden_feather>,
    [
        <item:minecraft:feather>,
        <item:forbidden_arcanus:arcane_gold_nugget>*8
    ]
);

<recipetype:create:milling>.addRecipe("arcane_gilded_nuggets",
    [<item:forbidden_arcanus:arcane_gold_nugget>],
    <item:forbidden_arcanus:arcane_gilded_darkstone>
);

// make pufifying soap use wax tag instead of only wax
craftingTable.removeRecipe(<item:forbidden_arcanus:purifying_soap>);
<recipetype:create:mixing>.removeRecipe(<item:forbidden_arcanus:purifying_soap>);

craftingTable.addShapeless("purifying_soap_tag",
    <item:forbidden_arcanus:purifying_soap>,
    [
        <item:forbidden_arcanus:arcane_crystal_dust>,
        <tag:items:forge:wax>,
        <tag:items:forge:slimeballs>,
        <tag:items:minecraft:small_flowers>
    ]
);
<recipetype:create:mixing>.addRecipe("purifying_soap_tag_mixing",
    "none",
    <item:forbidden_arcanus:purifying_soap>,
    [
        <item:forbidden_arcanus:arcane_crystal_dust>,
        <tag:items:forge:wax>,
        <tag:items:forge:slimeballs>,
        <tag:items:minecraft:small_flowers>
    ]
);

craftingTable.removeRecipe(<item:forbidden_arcanus:eternal_stella>);
<recipetype:create:mechanical_crafting>.addRecipe("eternal_stella",
    <item:forbidden_arcanus:eternal_stella>,
    [
        [<item:alexsmobs:mimicream>, <item:forbidden_arcanus:stellarite_piece>, <item:alexsmobs:mimicream>],
        [<item:forbidden_arcanus:xpetrified_orb>, <item:forbidden_arcanus:dark_nether_star>, <item:forbidden_arcanus:xpetrified_orb>],
        [<item:alexsmobs:mimicream>, <item:forbidden_arcanus:stellarite_piece>, <item:alexsmobs:mimicream>]
    ]
);


// automating Eidolon
// <recipetype:tconstruct:melting>.removeByName("materialis:smeltery/melting/metal/arcane_gold_inlay");

<recipetype:tconstruct:melting>.addMeltingRecipe("red_gold_ingot_melting", 
    <tag:items:forge:ingots/red_gold>, 
    <fluid:tconstruct:molten_signalum> * 144, 
    670, 
    280
);
<recipetype:tconstruct:melting>.addMeltingRecipe("red_gold_nugget_melting", 
    <tag:items:forge:nuggets/red_gold>, 
    <fluid:tconstruct:molten_signalum> * 144, 
    670, 
    10
);
<recipetype:tconstruct:melting>.addMeltingRecipe("red_gold_block_melting", 
    <tag:items:forge:storage_blocks/red_gold>,
    <fluid:tconstruct:molten_signalum> * 1296, 
    670, 
    840
);
<recipetype:tconstruct:melting>.addMeltingRecipe("red_gold_inlay_melting", 
    <tag:items:forge:inlays/red_gold>, 
    <fluid:tconstruct:molten_signalum> * 288, 
    670, 
    280
);
<recipetype:tconstruct:melting>.addMeltingRecipe("arcane_gold_dragon_scale_melting", 
    <item:forbidden_arcanus:golden_dragon_scale>, 
    <fluid:materialis:molten_arcane_gold> * 576, 
    670, 
    280
);
<recipetype:create:mixing>.addRecipe("red_gold_mixing",
    "heated",
    <fluid:tconstruct:molten_signalum>*288,
    [
        <item:minecraft:redstone>,
        <item:minecraft:redstone>,
        <item:eidolon:soul_shard>
    ],
    [
        <fluid:tconstruct:molten_gold>*288
    ]
);

<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("red_gold_block",
    <item:minecraft:air>,
    <fluid:tconstruct:molten_signalum> * 1296, 
    <item:eidolon:arcane_gold_block>, 
    160, 
    false, 
    false
);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("red_gold_ingot",
    <tag:items:tconstruct:casts/multi_use/ingot>,
    <fluid:tconstruct:molten_signalum> * 144, 
    <item:eidolon:arcane_gold_ingot>, 
    40, 
    false, 
    false
);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("golden_dragon_scale",
    <item:forbidden_arcanus:dragon_scale>,
    <fluid:materialis:molten_arcane_gold> * 576, 
    <item:forbidden_arcanus:golden_dragon_scale>, 
    80, 
    true, 
    false
);

<recipetype:tconstruct:casting_table>.addItemCastingRecipe("red_gold_nugget",
    <tag:items:tconstruct:casts/multi_use/ingot>,
    <fluid:tconstruct:molten_signalum> * 16, 
    <item:eidolon:arcane_gold_nugget>, 
    4, 
    false, 
    false
);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("red_gold_ingot_sand",
    <tag:items:tconstruct:casts/single_use/ingot>,
    <fluid:tconstruct:molten_signalum> * 144, 
    <item:eidolon:arcane_gold_nugget>, 
    40, 
    true, 
    false
);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("red_gold_nugget_sand",
    <tag:items:tconstruct:casts/single_use/nugget>,
    <fluid:tconstruct:molten_signalum> * 16, 
    <item:eidolon:arcane_gold_nugget>, 
    4, 
    true, 
    false
);

<recipetype:create:mixing>.addRecipe("shadow_gem_mixing",
    "superheated",
    <item:eidolon:shadow_gem>,
    [
        <tag:items:minecraft:coals>, 
        <item:minecraft:ghast_tear>, 
        <item:eidolon:death_essence>*2, 
        <item:eidolon:soul_shard>*2, 
        <item:minecraft:diamond>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("death_essence_mixing",
    "heated",
    <item:eidolon:death_essence>*4,
    [
        <tag:items:minecraft:coals>, 
        <item:minecraft:rotten_flesh>, 
        <item:eidolon:zombie_heart>, 
        <item:minecraft:bone_meal>*2
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("sulfur_mixing",
    "heated",
    <item:eidolon:sulfur>*2,
    [
        <tag:items:minecraft:coals>, 
        <item:eidolon:enchanted_ash>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("soul_gem_mixing",
    "heated",
    <item:eidolon:lesser_soul_gem>,
    [
        <tag:items:forge:dusts/redstone>*2, 
        <item:minecraft:lapis_lazuli>*2,
        <item:eidolon:soul_shard>*4,
        <item:minecraft:quartz> 
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("rotten_flesh_mixing_beef",
    "heated",
    <item:minecraft:rotten_flesh>,
    [
        <item:minecraft:beef>,
        <tag:items:forge:mushrooms>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("rotten_flesh_mixing_rabbit",
    "heated",
    <item:minecraft:rotten_flesh>,
    [
        <item:minecraft:rabbit>,
        <tag:items:forge:mushrooms>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("rotten_flesh_mixing_chicken",
    "heated",
    <item:minecraft:rotten_flesh>,
    [
        <item:minecraft:chicken>,
        <tag:items:forge:mushrooms>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("rotten_flesh_mixing_mutton",
    "heated",
    <item:minecraft:rotten_flesh>,
    [
        <item:minecraft:mutton>,
        <tag:items:forge:mushrooms>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("rotten_flesh_mixing_porkchop",
    "heated",
    <item:minecraft:rotten_flesh>,
    [
        <item:minecraft:porkchop>,
        <tag:items:forge:mushrooms>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("warped_sprouts_mixing",
    "heated",
    <item:eidolon:warped_sprouts>*2,
    [
        <item:eidolon:ender_calx>,
        <item:minecraft:warped_fungus>,
        <item:minecraft:nether_wart>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("ender_calx_mixing",
    "heated",
    <item:eidolon:ender_calx>*2,
    [
        <item:minecraft:ender_pearl>,
        <item:eidolon:enchanted_ash>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("fungus_sprouts_mixing",
    "heated",
    <item:eidolon:fungus_sprouts>*2,
    [
        <tag:items:forge:mushrooms>,
        <item:minecraft:bone_meal>,
        <item:minecraft:wheat_seeds>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("refined_crimson_mixing_roots",
    "heated",
    <item:eidolon:crimson_essence>*2,
    [
        <item:minecraft:crimson_roots>,
        <item:minecraft:nether_wart>,
        <item:eidolon:sulfur>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("refined_crimson_mixing_fungus",
    "heated",
    <item:eidolon:crimson_essence>*2,
    [
        <item:minecraft:crimson_fungus>,
        <item:minecraft:nether_wart>,
        <item:eidolon:sulfur>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("refined_crimson_mixing_vines",
    "heated",
    <item:eidolon:crimson_essence>*2,
    [
        <item:minecraft:weeping_vines>,
        <item:minecraft:nether_wart>,
        <item:eidolon:sulfur>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("gunpowder_mixing",
    "heated",
    <item:minecraft:gunpowder>*4,
    [
        <item:minecraft:bone_meal>,
        <item:minecraft:charcoal>,
        <item:eidolon:sulfur>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);
<recipetype:create:mixing>.addRecipe("polished_planks_mixing",
    "heated",
    <item:eidolon:polished_planks>*32,
    [
        <tag:items:minecraft:planks>*32,
        <item:eidolon:enchanted_ash>,
        <item:eidolon:soul_shard>
    ],
    [
        <fluid:minecraft:water>*1000
    ]
);