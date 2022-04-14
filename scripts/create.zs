#priority 50

import crafttweaker.api.BracketHandlers;


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

<recipetype:create:cutting>.removeByRegex("create:cutting/stripped_.*");

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

// gear addon
craftingTable.removeByModid("creategearaddon");
craftingTable.removeByModid("creategears");
craftingTable.removeRecipe(<item:create:cogwheel>);
craftingTable.removeRecipe(<item:create:large_cogwheel>);

stoneCutter.addRecipe("spruce_shaftless_cogwheel", <item:creategears:gear> * 2, <item:minecraft:spruce_slab>);
stoneCutter.addRecipe("large_spruce_shaftless_cogwheel", <item:creategears:large_gear>, <item:minecraft:spruce_slab>);
stoneCutter.addRecipe("spruce_half_shaft_cogwheel", <item:creategears:half_shaft_gear>, <item:create:cogwheel>);
stoneCutter.addRecipe("large_spruce_half_shaft_cogwheel", <item:creategears:large_half_shaft_gear>, <item:create:large_cogwheel>);

craftingTable.addShapeless("large_spruce_cogwheel", <item:create:large_cogwheel>, [<item:creategears:large_gear>, <item:create:shaft>]);
craftingTable.addShapeless("spruce_cogwheel", <item:create:cogwheel>, [<item:creategears:gear>, <item:create:shaft>]);
<recipetype:create:deploying>.addRecipe("spruce_cogwheel_auto", <item:creategears:gear>, <item:create:shaft>, [<item:create:cogwheel>]);
<recipetype:create:deploying>.addRecipe("large_spruce_cogwheel_auto", <item:creategears:large_gear>, <item:create:shaft>, [<item:create:large_cogwheel>]);


var woodTypes = ["oak", "birch", "jungle", "acacia", "dark_oak", "crimson", "warped"];
for woodType in woodTypes {
    stoneCutter.addRecipe(woodType + "_shaftless_cogwheel", BracketHandlers.getItem("creategearaddon:shaftless_" + woodType + "_cogwheel") * 2, BracketHandlers.getItem("minecraft:" + woodType + "_slab"));
    stoneCutter.addRecipe("large_" + woodType + "_shaftless_cogwheel", BracketHandlers.getItem("creategearaddon:large_shaftless_" + woodType + "_cogwheel"), BracketHandlers.getItem("minecraft:" + woodType + "_slab"));
    stoneCutter.addRecipe(woodType + "_half_shaft_cogwheel", BracketHandlers.getItem("creategearaddon:half_shaft_" + woodType + "_cogwheel"), BracketHandlers.getItem("creategearaddon:" + woodType + "_cogwheel"));
    stoneCutter.addRecipe("large_" + woodType + "_half_shaft_cogwheel", BracketHandlers.getItem("creategearaddon:large_half_shaft_" + woodType + "_cogwheel"), BracketHandlers.getItem("creategearaddon:large_" + woodType + "_cogwheel"));

    craftingTable.addShapeless("large_" + woodType + "_cogwheel", BracketHandlers.getItem("creategearaddon:large_" + woodType + "_cogwheel"), [BracketHandlers.getItem("creategearaddon:large_shaftless_" + woodType + "_cogwheel"), <item:create:shaft>]);
    craftingTable.addShapeless(woodType + "_cogwheel", BracketHandlers.getItem("creategearaddon:" + woodType + "_cogwheel"), [BracketHandlers.getItem("creategearaddon:shaftless_" + woodType + "_cogwheel"), <item:create:shaft>]);
    <recipetype:create:deploying>.addRecipe(woodType + "_cogwheel_auto", BracketHandlers.getItem("creategearaddon:shaftless_" + woodType + "_cogwheel"), <item:create:shaft>, [BracketHandlers.getItem("creategearaddon:" + woodType + "_cogwheel")]);
    <recipetype:create:deploying>.addRecipe("large_" + woodType + "_cogwheel_auto", BracketHandlers.getItem("creategearaddon:large_shaftless_" + woodType + "_cogwheel"), <item:create:shaft>, [BracketHandlers.getItem("creategearaddon:large_" + woodType + "_cogwheel")]);

}
woodTypes = ["cherry", "dead", "fir", "hellbark", "jacaranda", "magic", "mahogany", "palm", "redwood", "umbran", "willow"];
for woodType in woodTypes {
    stoneCutter.addRecipe(woodType + "_shaftless_cogwheel", BracketHandlers.getItem("creategearaddon:shaftless_" + woodType + "_cogwheel") * 2, BracketHandlers.getItem("biomesoplenty:" + woodType + "_slab"));
    stoneCutter.addRecipe("large_" + woodType + "_shaftless_cogwheel", BracketHandlers.getItem("creategearaddon:large_shaftless_" + woodType + "_cogwheel"), BracketHandlers.getItem("biomesoplenty:" + woodType + "_slab"));
    stoneCutter.addRecipe(woodType + "_half_shaft_cogwheel", BracketHandlers.getItem("creategearaddon:half_shaft_" + woodType + "_cogwheel"), BracketHandlers.getItem("creategearaddon:" + woodType + "_cogwheel"));
    stoneCutter.addRecipe("large_"  + woodType + "_half_shaft_cogwheel", BracketHandlers.getItem("creategearaddon:large_half_shaft_" + woodType + "_cogwheel"), BracketHandlers.getItem("creategearaddon:large_" + woodType + "_cogwheel"));
    
    craftingTable.addShapeless(woodType + "_cogwheel", BracketHandlers.getItem("creategearaddon:" + woodType + "_cogwheel"), [BracketHandlers.getItem("creategearaddon:shaftless_" + woodType + "_cogwheel"), <item:create:shaft>]);
    craftingTable.addShapeless("large_" + woodType + "_cogwheel", BracketHandlers.getItem("creategearaddon:large_" + woodType + "_cogwheel"), [BracketHandlers.getItem("creategearaddon:large_shaftless_" + woodType + "_cogwheel"), <item:create:shaft>]);

    <recipetype:create:deploying>.addRecipe(woodType + "_cogwheel_auto", BracketHandlers.getItem("creategearaddon:shaftless_" + woodType + "_cogwheel"), <item:create:shaft>, [BracketHandlers.getItem("creategearaddon:" + woodType + "_cogwheel")]);
    <recipetype:create:deploying>.addRecipe("large_" + woodType + "_cogwheel_auto", BracketHandlers.getItem("creategearaddon:large_shaftless_" + woodType + "_cogwheel"), <item:create:shaft>, [BracketHandlers.getItem("creategearaddon:large_" + woodType + "_cogwheel")]);
}