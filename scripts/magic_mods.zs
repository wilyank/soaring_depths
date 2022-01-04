#priority 10

// Astral Sorcery's ores
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

<recipetype:astralsorcery:liquid_interaction>.addRecipe("liquid_interaction_failed", <item:endergetic:cracked_purpur_block>, <fluid:tconstruct:molten_ender>*1000, 100, <fluid:tconstruct:molten_manyullyn>*1000, 100, 80);
<recipetype:astralsorcery:liquid_interaction>.addRecipe("liquid_interaction_success", <entitytype:minecraft:shulker>, <fluid:tconstruct:molten_ender>*1000, 100, <fluid:tconstruct:molten_manyullyn>*1000, 100, 20);

// remove Mutant More's potion recipes
brewing.removeRecipeByReagent(<item:minecraft:obsidian>);
brewing.removeRecipeByInput(<item:mutantmore:formula_y>);
