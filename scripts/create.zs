#priority 50

// This script tweaks recipes added by Create or it's addons

var _ = <item:minecraft:air>;

var i = <tag:items:forge:ingots/iron>;
var s = <tag:items:forge:plates/iron>;
var b = <item:minecraft:bricks>;
var p = <item:create:fluid_pipe>;
var pl = <tag:items:minecraft:planks>;
var c = <item:steampowered:bronze_cogwheel>;
var sh = <item:create:shaft>;
var a = <item:create:andesite_alloy>;
var prec_mech = <item:create:precision_mechanism>;
var brass_casing = <item:create:brass_casing>;
var cogwheels = <tag:items:forge:cogwheels>;



craftingTable.addShapedMirrored("andesite_cobble_iron_alloy",
    a,
    [
        [<item:minecraft:iron_nugget>, <item:create:andesite_cobblestone>],
        [<item:create:andesite_cobblestone>, <item:minecraft:iron_nugget>]
    ]
);
craftingTable.addShapedMirrored("andesite_cobble_zinc_alloy",
    a,
    [
        [<item:create:zinc_nugget>, <item:create:andesite_cobblestone>],
        [<item:create:andesite_cobblestone>, <item:create:zinc_nugget>]
    ]
);

// fix cast iron large cogwheel recipe
craftingTable.removeRecipe(<item:steampowered:cast_iron_large_cogwheel>);
craftingTable.addShaped("cast_iron_large_cogwheel",
    <item:steampowered:cast_iron_large_cogwheel>*2,
    [
        [i, s, i],
        [s, a, s],
        [i, s, i]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mc_cast_iron_large_cogwheel",
    <item:steampowered:cast_iron_large_cogwheel>*2,
    [
        [i, s, i],
        [s, a, s],
        [i, s, i]
    ]
);

// fix bronze machines being crafted with brass
s = <tag:items:forge:plates/bronze>;
i = <tag:items:forge:ingots/silicon_bronze>;

// bronze sheet
<recipetype:create:pressing>.addRecipe("bronze_sheet", [<item:steampowered:bronze_sheet>], i);
<recipetype:tconstruct:casting_table>.addItemCastingRecipe("cast_bronze_sheet", 
    <item:tconstruct:plate_cast>, 
    <fluid:tconstruct:molten_tinkers_bronze> * 144, 
    <item:steampowered:bronze_sheet>, 
    40, 
    false, 
    false
);

// small bronze cogwheel
craftingTable.removeRecipe(c);
craftingTable.addShaped("bronze_cogwheel",
    c*8,
    [
        [i, i, i],
        [i, a, i],
        [i, i, i]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_cogwheel",
    c*8,
    [
        [i, i, i],
        [i, a, i],
        [i, i, i]
    ]
);
// large bronze cogwheel
craftingTable.removeRecipe(<item:steampowered:bronze_large_cogwheel>);
craftingTable.addShaped("bronze_large_cogwheel",
    <item:steampowered:bronze_large_cogwheel>*2,
    [
        [i, s, i],
        [s, a, s],
        [i, s, i]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_large_cogwheel",
    <item:steampowered:bronze_large_cogwheel>*2,
    [
        [i, s, i],
        [s, a, s],
        [i, s, i]
    ]
);
// bronze burner
craftingTable.removeRecipe(<item:steampowered:bronze_burner>);
craftingTable.addShaped("bronze_burner", 
    <item:steampowered:bronze_burner>, 
    [
        [s, s, s],
        [s, _, s],
        [b, b, b]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_burner", 
    <item:steampowered:bronze_burner>, 
    [
        [s, s, s],
        [s, _, s],
        [b, b, b]
    ]
);
// bronze boiler
craftingTable.removeRecipe(<item:steampowered:bronze_boiler>);
craftingTable.addShaped("bronze_boiler",
    <item:steampowered:bronze_boiler>,
    [
        [s, s, s],
        [s, p, s],
        [s, p, s]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_boiler", 
    <item:steampowered:bronze_boiler>,
    [
        [s, s, s],
        [s, p, s],
        [s, p, s]
    ]
);
// bronze steam engine
<recipetype:create:mechanical_crafting>.removeRecipe(<item:steampowered:bronze_steam_engine>);
<recipetype:create:mechanical_crafting>.addRecipe("mc_bronze_steam_engine", 
    <item:steampowered:bronze_steam_engine>, 
    [
        [s, p, i],
        [s, p, <item:minecraft:piston>],
        [s, p, i]
    ]
);
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
    ]
);

craftingTable.removeRecipe(<item:create:brass_hand>);
craftingTable.addShaped("bronze_hand", 
    <item:create:brass_hand>,
    [
        [_, <item:create:andesite_alloy>, _],
        [s, s, s],
        [_, s, _]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe(
    "mech_bronze_hand", 
    <item:create:brass_hand>,
    [
        [_, <item:create:andesite_alloy>, _],
        [s, s, s],
        [_, s, _]
    ]
);

// tweak electron tube recipe
craftingTable.removeRecipe(<item:create:rose_quartz>);
craftingTable.addShapeless("crafting_rose_quartz", <item:create:rose_quartz>, 
    [
        <item:minecraft:quartz>, 
        <item:minecraft:redstone>, 
        <item:minecraft:redstone>, 
        <item:minecraft:redstone>, 
        <item:minecraft:redstone>
    ]
);
<recipetype:create:mixing>.addRecipe("mixing_rose_quartz",
    "none",
    <item:create:rose_quartz>,
    [
        <item:minecraft:quartz>, 
        <item:minecraft:redstone>, 
        <item:minecraft:redstone>, 
        <item:minecraft:redstone>, 
        <item:minecraft:redstone>
    ]
);

craftingTable.removeRecipe(<item:create:electron_tube>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("electron_tube")
    .transitionTo(<item:create:polished_rose_quartz>)
    .require(<item:create:polished_rose_quartz>)
    .loops(1)
    .addOutput(<item:create:electron_tube>, 1)
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:minecraft:redstone_torch>))
    .addStep(<recipetype:create:filling>.factory(), (rb) => rb.require(<fluid:tconstruct:molten_iron>*16))
    .addStep(<recipetype:create:pressing>.factory(), (rb) => rb.duration(50))
);
<recipetype:create:deploying>.registerRecipe("redstone_torch_deploying", (rb) => {
    rb.output(<item:minecraft:redstone_torch>);
    rb.require(<item:minecraft:stick>);
    rb.require(<item:minecraft:redstone>);
});


<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("precision_mechanism")
    .transitionTo(<item:create:incomplete_precision_mechanism>)
    .require(<item:create:golden_sheet>)
    .loops(1)
    .addOutput(<item:create:precision_mechanism>, 1)
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(cogwheels))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<tag:items:forge:large_cogwheels>))
    .addStep(<recipetype:create:pressing>.factory(), (rb) => rb.duration(20))
    .addStep(<recipetype:create:deploying>.factory(), (rb) => rb.require(<item:create:electron_tube>))
);

craftingTable.removeRecipe(<item:create:deployer>);
craftingTable.addShaped("deployer",
    <item:create:deployer>,
    [
        [_, cogwheels, _],
        [cogwheels, <item:create:brass_casing>, cogwheels],
        [_, <item:create:brass_hand>, _]
    ]
);

craftingTable.removeRecipe(<item:create:mechanical_press>);
craftingTable.addShaped("press",
    <item:create:mechanical_press>,
    [
        [<item:minecraft:air>, <item:create:andesite_alloy>, <item:minecraft:air>],
        [cogwheels, <item:create:andesite_casing>, cogwheels],
        [<item:minecraft:air>, <item:minecraft:iron_block>, <item:minecraft:air>]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mechanical_press",
    <item:create:mechanical_press>,
    [
        [<item:minecraft:air>, <item:create:andesite_alloy>, <item:minecraft:air>],
        [cogwheels, <item:create:andesite_casing>, cogwheels],
        [<item:minecraft:air>, <item:minecraft:iron_block>, <item:minecraft:air>]
    ]
);
craftingTable.removeRecipe(<item:create:speedometer>);
craftingTable.addShaped("speedometer",
    <item:create:speedometer>,
    [
        [_, <item:minecraft:compass> ,_],
        [sh, <item:create:andesite_casing>, sh],
        [_, <item:create:electron_tube> , _]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mechanical_speedometer",
    <item:create:speedometer>,
    [
        [_, <item:minecraft:compass> ,_],
        [sh, <item:create:andesite_casing>, sh],
        [_, <item:create:electron_tube> , _]
    ]
);
craftingTable.removeRecipe(<item:create:stressometer>);
craftingTable.addShaped("stressometer",
    <item:create:stressometer>,
    [
        [_, <item:minecraft:compass> ,_],
        [sh, <item:create:andesite_casing>, sh],
        [_, <item:create:electron_tube> , _]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mechanical_stressometer",
    <item:create:stressometer>,
    [
        [<item:create:speedometer>]
    ]
);

craftingTable.removeRecipe(<item:create:redstone_link>);
craftingTable.addShapedMirrored("redstone_link",
    <item:create:redstone_link>*2,
    [
        [_, _, <item:create:electron_tube>],
        [<item:create:brass_sheet>, <tag:items:minecraft:planks>, <item:createaddition:copper_wire>]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mechanical_redstone_link",
    <item:create:redstone_link>*2,
    [
        [_, _, <item:create:electron_tube>],
        [<item:create:brass_sheet>, <tag:items:minecraft:planks>, <item:createaddition:copper_wire>]
    ]
);

craftingTable.removeRecipe(<item:create:schematicannon>);
craftingTable.addShaped("schematicannon",
    <item:create:schematicannon>,
    [
        [<item:create:precision_mechanism>, <item:minecraft:cauldron>, <item:create:precision_mechanism>],
        [<tag:items:minecraft:logs>, <item:minecraft:dispenser>, <tag:items:minecraft:logs>],
        [<item:minecraft:smooth_stone>, <item:minecraft:iron_block>, <item:minecraft:smooth_stone>]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mechanical_schematicannon",
    <item:create:schematicannon>,
    [
        [<item:create:precision_mechanism>, <item:minecraft:cauldron>, <item:create:precision_mechanism>],
        [<tag:items:minecraft:logs>, <item:minecraft:dispenser>, <tag:items:minecraft:logs>],
        [<item:minecraft:smooth_stone>, <item:minecraft:iron_block>, <item:minecraft:smooth_stone>]
    ]
);

craftingTable.removeRecipe(<item:create:mechanical_arm>);
craftingTable.addShaped("mechanical_arm",
    <item:create:mechanical_arm>,
    [
        [<tag:items:forge:rods/brass>, <tag:items:forge:plates/brass>, a],
        [<tag:items:forge:rods/brass>, <item:steampowered:bronze_cogwheel>, _],
        [<item:create:precision_mechanism>, <item:create:brass_casing>, <item:create:precision_mechanism>]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mech_mechanical_arm",
    <item:create:mechanical_arm>,
    [
        [<tag:items:forge:rods/brass>, <tag:items:forge:plates/brass>, a],
        [<tag:items:forge:rods/brass>, <item:steampowered:bronze_cogwheel>, _],
        [<item:create:precision_mechanism>, <item:create:brass_casing>, <item:create:precision_mechanism>]
    ]
);

craftingTable.removeRecipe(<item:create:sequenced_gearshift>);
craftingTable.addShaped("seq_gearshift",
    <item:create:sequenced_gearshift>,
    [
        [prec_mech, <item:create:electron_tube>, prec_mech],
        [cogwheels, brass_casing, cogwheels],
        [prec_mech, <item:minecraft:clock>, prec_mech]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mech_eq_gearshift",
    <item:create:sequenced_gearshift>,
    [
        [prec_mech, <item:create:electron_tube>, prec_mech],
        [cogwheels, brass_casing, cogwheels],
        [prec_mech, <item:minecraft:clock>, prec_mech]
    ]
);

craftingTable.removeRecipe(<item:create:rotation_speed_controller>);
craftingTable.addShaped("rot_speed_controller",
    <item:create:rotation_speed_controller>,
    [
        [prec_mech, <item:create:electron_tube>, prec_mech],
        [sh, brass_casing, sh],
        [prec_mech, <item:minecraft:compass>, prec_mech]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mech_rot_speed_controller",
    <item:create:rotation_speed_controller>,
    [
        [prec_mech, <item:create:electron_tube>, prec_mech],
        [sh, brass_casing, sh],
        [prec_mech, <item:minecraft:compass>, prec_mech]
    ]
);

craftingTable.removeRecipe(<item:create:whisk>);
craftingTable.addShaped("whisk",
    <item:create:whisk>,
    [
        [_, a, _],
        [<tag:items:forge:rods/iron>, a, <tag:items:forge:rods/iron>],
        [_, <tag:items:forge:rods/iron>, _]
    ]
);
<recipetype:create:mechanical_crafting>.addRecipe("mech_whisk",
    <item:create:whisk>,
    [
        [_, a, _],
        [<tag:items:forge:rods/iron>, a, <tag:items:forge:rods/iron>],
        [_, <tag:items:forge:rods/iron>, _]
    ]
);