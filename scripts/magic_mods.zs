#priority 10

import crafttweaker.api.util.text.MCTextComponent;


// Astral Sorcery's ores
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("rock_crystal_ore")
    .transitionTo(<item:minecraft:diorite>)
    .require(<tag:items:forge:ores>)
    .loops(1)
    .addOutput(<item:astralsorcery:rock_crystal_ore>, 1)
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:forbidden_arcanus:wet_purifying_soap>))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:minecraft:water>*250))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:tconstruct:molten_quartz>*144))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:eidolon:unholy_symbol>))
);
<recipetype:astralsorcery:block_transmutation>.addRecipe("arcane_crystal_ore_discidia", 
    <blockstate:forbidden_arcanus:arcane_crystal_ore>, 
    <blockstate:forbidden_arcanus:arcane_polished_darkstone>, 
    true, 
    200, 
    <resource:astralsorcery:discidia>
);
<recipetype:astralsorcery:block_transmutation>.addRecipe("arcane_crystal_ore_armara", 
    <blockstate:forbidden_arcanus:arcane_crystal_ore>, 
    <blockstate:forbidden_arcanus:arcane_polished_darkstone>, 
    true, 
    200, 
    <resource:astralsorcery:armara>
);
<recipetype:astralsorcery:block_transmutation>.addRecipe("arcane_crystal_ore_vicio", 
    <blockstate:forbidden_arcanus:arcane_crystal_ore>, 
    <blockstate:forbidden_arcanus:arcane_polished_darkstone>, 
    true, 
    200, 
    <resource:astralsorcery:vicio>
);
<recipetype:astralsorcery:block_transmutation>.addRecipe("arcane_crystal_ore_aevitas", 
    <blockstate:forbidden_arcanus:arcane_crystal_ore>, 
    <blockstate:forbidden_arcanus:arcane_polished_darkstone>, 
    true, 
    200, 
    <resource:astralsorcery:aevitas>
);
<recipetype:astralsorcery:block_transmutation>.addRecipe("arcane_crystal_ore_evorsio", 
    <blockstate:forbidden_arcanus:arcane_crystal_ore>, 
    <blockstate:forbidden_arcanus:arcane_polished_darkstone>, 
    true, 
    200, 
    <resource:astralsorcery:evorsio>
);

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
<recipetype:astralsorcery:block_transmutation>.addRecipe("stella_arcanum",
    <blockstate:forbidden_arcanus:stella_arcanum>,
    <blockstate:forbidden_arcanus:xpetrified_ore>,
    true,
    200
);

mods.jei.JEI.addInfo(<item:forbidden_arcanus:arcane_gold_nugget>, ["Can be grown from Golden Orchid Seeds."]);
craftingTable.removeRecipe(<item:forbidden_arcanus:golden_orchid_seeds>);
<recipetype:create:mixing>.addRecipe("golden_orchid_seeds", 
    "heated",
    <item:forbidden_arcanus:golden_orchid_seeds>,
    [
        <tag:items:forge:seeds>,
        <item:forbidden_arcanus:arcane_gold_nugget>*8
    ]    
);
<recipetype:tconstruct:melting>.addMeltingRecipe("golden_orchid_seeds_melting", 
    <item:forbidden_arcanus:golden_orchid_seeds>, 
    <fluid:tconstruct:molten_gold>*16, 
    700, 
    80
);

<recipetype:astralsorcery:liquid_interaction>.addRecipe("shulker_liquid_interaction_failed", <item:endergetic:cracked_purpur_block>, <fluid:tconstruct:molten_ender>*1000, 100, <fluid:tconstruct:molten_manyullyn>*1000, 100, 80);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("shulker_liquid_interaction_success", <entitytype:minecraft:shulker>, <fluid:tconstruct:molten_ender>*1000, 100, <fluid:tconstruct:molten_manyullyn>*1000, 100, 20);

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
        <fluid:tconstruct:molten_pewter> * 144, 
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
        <fluid:tconstruct:molten_diamond> * 144, 
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
        <fluid:tconstruct:molten_debris> * 144, 
        <fluid:create:potion>.withTag({Bottle: "REGULAR", Potion: "infernalexp:strong_infection"})*250
    ]
);


mods.jei.JEI.addInfo(<item:forbidden_arcanus:dark_runestone>, ["Right click with Runestone on an activated Runic Tenebris Core to obtain"]);
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
