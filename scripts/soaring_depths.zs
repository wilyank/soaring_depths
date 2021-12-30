import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.MCItemDefinition;
import stdlib.List;

craftingTable.removeRecipe(<item:minecraft:end_portal_frame>);
craftingTable.addShaped("end_portal_frame", <item:minecraft:end_portal_frame>, [[<item:minecraft:air>, <item:minecraft:ender_pearl>, <item:minecraft:air>],[<item:eidolon:shadow_gem>,<item:forbidden_arcanus:end_crystal_gem>, <item:eidolon:shadow_gem>], [<item:infernalexp:glowstone_bricks>, <item:infernalexp:glowstone_bricks>, <item:infernalexp:glowstone_bricks>]]);


// Simple Storage Network's blocks
craftingTable.removeRecipe(<item:storagenetwork:inventory>);
craftingTable.removeRecipe(<item:storagenetwork:master>);
craftingTable.removeRecipe(<item:storagenetwork:request>);
craftingTable.removeRecipe(<item:storagenetwork:kabel>);
craftingTable.removeRecipe(<item:storagenetwork:storage_kabel>);
craftingTable.removeRecipe(<item:storagenetwork:import_kabel>);
craftingTable.removeRecipe(<item:storagenetwork:import_filter_kabel>);
craftingTable.removeRecipe(<item:storagenetwork:filter_kabel>);
craftingTable.removeRecipe(<item:storagenetwork:export_kabel>);

craftingTable.removeRecipe(<item:storagenetwork:exchange>);
craftingTable.removeRecipe(<item:storagenetwork:collector>);

craftingTable.addShaped("storagenetwork_master", 
    <item:storagenetwork:master>, 
    [
        [<item:storagenetwork:kabel>,<tag:items:forge:gems/diamond>, <item:storagenetwork:kabel>], 
        [<tag:items:forge:gems/diamond>, <item:create:brass_casing>, <tag:items:forge:gems/diamond>], 
        [<item:storagenetwork:kabel>, <tag:items:forge:gems/diamond>,<item:storagenetwork:kabel>]
    ]);
craftingTable.addShaped("storagenetwork_inventory", 
    <item:storagenetwork:inventory>, 
    [
        [<item:storagenetwork:kabel>,<item:infernalexp:quartz_glass_pane>, <item:storagenetwork:kabel>], 
        [<item:infernalexp:quartz_glass_pane>, <item:create:brass_casing>, <item:infernalexp:quartz_glass_pane>], 
        [<item:storagenetwork:kabel>, <item:infernalexp:quartz_glass_pane>,<item:storagenetwork:kabel>]
    ]);
craftingTable.addShaped("storagenetwork_collector", 
    <item:storagenetwork:collector>, 
    [
        [<item:storagenetwork:kabel>,<item:create:portable_storage_interface>, <item:storagenetwork:kabel>], 
        [<item:create:portable_storage_interface>, <item:create:brass_casing>, <item:create:portable_storage_interface>], 
        [<item:storagenetwork:kabel>, <item:create:portable_storage_interface>,<item:storagenetwork:kabel>]
    ]);
smithing.addRecipe("storagenetwork_request", <item:storagenetwork:request>, <item:storagenetwork:inventory>, <item:minecraft:crafting_table>);
craftingTable.addShaped("storagenetwork_kabel", 
    <item:storagenetwork:kabel>, 
    [
        [<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>],
        [<tag:items:forge:wires/iron>,<tag:items:forge:wires/iron>,<tag:items:forge:wires/iron>],
        [<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>]
    ]);
stoneCutter.addRecipe("storagenetwork_storage_cable", <item:storagenetwork:storage_kabel>, <item:storagenetwork:kabel>);
stoneCutter.addRecipe("storagenetwork_import_cable", <item:storagenetwork:import_kabel>, <item:storagenetwork:kabel>);
stoneCutter.addRecipe("storagenetwork_import_filter_cable", <item:storagenetwork:import_filter_kabel>, <item:storagenetwork:kabel>);
stoneCutter.addRecipe("storagenetwork_filter_cable", <item:storagenetwork:filter_kabel>, <item:storagenetwork:kabel>);
stoneCutter.addRecipe("storagenetwork_export_cable", <item:storagenetwork:export_kabel>, <item:storagenetwork:kabel>);

// Simple Storage Network's items
craftingTable.removeRecipe(<item:storagenetwork:inventory_remote>);
craftingTable.addShaped(
    "storagenetwork_inventory_remote",
    <item:storagenetwork:inventory_remote>,
    [
        [<item:create:linked_controller>],
        [<item:storagenetwork:inventory>]
    ]);

craftingTable.removeRecipe(<item:storagenetwork:crafting_remote>);
smithing.addRecipe("storagenetwork_crafting_remote", <item:storagenetwork:crafting_remote>, <item:storagenetwork:inventory_remote>, <item:minecraft:crafting_table>);
craftingTable.removeRecipe(<item:storagenetwork:collector_remote>);
smithing.addRecipe("storagenetwork_collector_remote", <item:storagenetwork:collector_remote>, <item:storagenetwork:inventory_remote>, <item:minecraft:hopper>);
craftingTable.removeRecipe(<item:storagenetwork:picker_remote>);
smithing.addRecipe("storagenetwork_picker_remote", <item:storagenetwork:picker_remote>, <item:storagenetwork:inventory_remote>, <item:minecraft:ender_pearl>);
craftingTable.removeRecipe(<item:storagenetwork:builder_remote>);
smithing.addRecipe("storagenetwork_builder_remote", <item:storagenetwork:builder_remote>, <item:storagenetwork:inventory_remote>, <item:minecraft:ender_chest>);

// oredictionary fixes
var forge_gems = <tag:items:forge:gems>;
forge_gems.add(<item:biomesoplenty:nether_crystal>);
//forge_gems.add(<item:betterendforge:amber_gem>);
<tag:items:forge:leather>.remove(<item:forbidden_arcanus:rotten_leather>);

craftingTable.addShapeless("wite_sand_cast", <item:tconstruct:blank_sand_cast>*4, [<item:biomesoplenty:white_sand>]);
craftingTable.addShapeless("orange_sand_cast", <item:tconstruct:blank_red_sand_cast>*4, [<item:biomesoplenty:orange_sand>]);

// remove rail duping exploit with tinker's construct
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ingot_1");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ingot_6_16");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/gold/powered_rail");

// add cobalt crystal melting into cobalt
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_shard_melting", <item:outer_end:cobalt_crystal_shard>, <fluid:tconstruct:molten_cobalt>, 950, 1);
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_melting", <item:outer_end:cobalt_crystal>, <fluid:tconstruct:molten_cobalt>*4, 950, 4);
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_lamp_melting", <item:outer_end:cobalt_crystal_lamp>, <fluid:tconstruct:molten_cobalt>*4, 950, 4);

