// this scripts tweaks the storage mods (SSN, Drawers and Metal Barrels)

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



// drawer cutting
craftingTable.removeRecipe(<item:storagedrawers:oak_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:oak_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:oak_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:oak_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:oak_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:oak_half_drawers_4>);

stoneCutter.addRecipe("oak_drawer_1", <item:storagedrawers:oak_full_drawers_1>, <item:storagedrawers:oak_trim>);
stoneCutter.addRecipe("oak_drawer_2", <item:storagedrawers:oak_full_drawers_2>, <item:storagedrawers:oak_trim>);
stoneCutter.addRecipe("oak_drawer_4", <item:storagedrawers:oak_full_drawers_4>, <item:storagedrawers:oak_trim>);
stoneCutter.addRecipe("oak_drawer_half_1", <item:storagedrawers:oak_half_drawers_1>*2, <item:storagedrawers:oak_trim>);
stoneCutter.addRecipe("oak_drawer_half_2", <item:storagedrawers:oak_half_drawers_2>*2, <item:storagedrawers:oak_trim>);
stoneCutter.addRecipe("oak_drawer_half_4", <item:storagedrawers:oak_half_drawers_4>*2, <item:storagedrawers:oak_trim>);

craftingTable.removeRecipe(<item:storagedrawers:spruce_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:spruce_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:spruce_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:spruce_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:spruce_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:spruce_half_drawers_4>);

stoneCutter.addRecipe("spruce_drawer_1", <item:storagedrawers:spruce_full_drawers_1>, <item:storagedrawers:spruce_trim>);
stoneCutter.addRecipe("spruce_drawer_2", <item:storagedrawers:spruce_full_drawers_2>, <item:storagedrawers:spruce_trim>);
stoneCutter.addRecipe("spruce_drawer_4", <item:storagedrawers:spruce_full_drawers_4>, <item:storagedrawers:spruce_trim>);
stoneCutter.addRecipe("spruce_drawer_half_1", <item:storagedrawers:spruce_half_drawers_1>*2, <item:storagedrawers:spruce_trim>);
stoneCutter.addRecipe("spruce_drawer_half_2", <item:storagedrawers:spruce_half_drawers_2>*2, <item:storagedrawers:spruce_trim>);
stoneCutter.addRecipe("spruce_drawer_half_4", <item:storagedrawers:spruce_half_drawers_4>*2, <item:storagedrawers:spruce_trim>);

craftingTable.removeRecipe(<item:storagedrawers:birch_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:birch_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:birch_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:birch_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:birch_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:birch_half_drawers_4>);

stoneCutter.addRecipe("birch_drawer_1", <item:storagedrawers:birch_full_drawers_1>, <item:storagedrawers:birch_trim>);
stoneCutter.addRecipe("birch_drawer_2", <item:storagedrawers:birch_full_drawers_2>, <item:storagedrawers:birch_trim>);
stoneCutter.addRecipe("birch_drawer_4", <item:storagedrawers:birch_full_drawers_4>, <item:storagedrawers:birch_trim>);
stoneCutter.addRecipe("birch_drawer_half_1", <item:storagedrawers:birch_half_drawers_1>*2, <item:storagedrawers:birch_trim>);
stoneCutter.addRecipe("birch_drawer_half_2", <item:storagedrawers:birch_half_drawers_2>*2, <item:storagedrawers:birch_trim>);
stoneCutter.addRecipe("birch_drawer_half_4", <item:storagedrawers:birch_half_drawers_4>*2, <item:storagedrawers:birch_trim>);

craftingTable.removeRecipe(<item:storagedrawers:jungle_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:jungle_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:jungle_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:jungle_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:jungle_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:jungle_half_drawers_4>);

stoneCutter.addRecipe("jungle_drawer_1", <item:storagedrawers:jungle_full_drawers_1>, <item:storagedrawers:jungle_trim>);
stoneCutter.addRecipe("jungle_drawer_2", <item:storagedrawers:jungle_full_drawers_2>, <item:storagedrawers:jungle_trim>);
stoneCutter.addRecipe("jungle_drawer_4", <item:storagedrawers:jungle_full_drawers_4>, <item:storagedrawers:jungle_trim>);
stoneCutter.addRecipe("jungle_drawer_half_1", <item:storagedrawers:jungle_half_drawers_1>*2, <item:storagedrawers:jungle_trim>);
stoneCutter.addRecipe("jungle_drawer_half_2", <item:storagedrawers:jungle_half_drawers_2>*2, <item:storagedrawers:jungle_trim>);
stoneCutter.addRecipe("jungle_drawer_half_4", <item:storagedrawers:jungle_half_drawers_4>*2, <item:storagedrawers:jungle_trim>);

craftingTable.removeRecipe(<item:storagedrawers:acacia_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:acacia_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:acacia_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:acacia_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:acacia_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:acacia_half_drawers_4>);

stoneCutter.addRecipe("acacia_drawer_1", <item:storagedrawers:acacia_full_drawers_1>, <item:storagedrawers:acacia_trim>);
stoneCutter.addRecipe("acacia_drawer_2", <item:storagedrawers:acacia_full_drawers_2>, <item:storagedrawers:acacia_trim>);
stoneCutter.addRecipe("acacia_drawer_4", <item:storagedrawers:acacia_full_drawers_4>, <item:storagedrawers:acacia_trim>);
stoneCutter.addRecipe("acacia_drawer_half_1", <item:storagedrawers:acacia_half_drawers_1>*2, <item:storagedrawers:acacia_trim>);
stoneCutter.addRecipe("acacia_drawer_half_2", <item:storagedrawers:acacia_half_drawers_2>*2, <item:storagedrawers:acacia_trim>);
stoneCutter.addRecipe("acacia_drawer_half_4", <item:storagedrawers:acacia_half_drawers_4>*2, <item:storagedrawers:acacia_trim>);

craftingTable.removeRecipe(<item:storagedrawers:dark_oak_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:dark_oak_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:dark_oak_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:dark_oak_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:dark_oak_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:dark_oak_half_drawers_4>);

stoneCutter.addRecipe("dark_oak_drawer_1", <item:storagedrawers:dark_oak_full_drawers_1>, <item:storagedrawers:dark_oak_trim>);
stoneCutter.addRecipe("dark_oak_drawer_2", <item:storagedrawers:dark_oak_full_drawers_2>, <item:storagedrawers:dark_oak_trim>);
stoneCutter.addRecipe("dark_oak_drawer_4", <item:storagedrawers:dark_oak_full_drawers_4>, <item:storagedrawers:dark_oak_trim>);
stoneCutter.addRecipe("dark_oak_drawer_half_1", <item:storagedrawers:dark_oak_half_drawers_1>*2, <item:storagedrawers:dark_oak_trim>);
stoneCutter.addRecipe("dark_oak_drawer_half_2", <item:storagedrawers:dark_oak_half_drawers_2>*2, <item:storagedrawers:dark_oak_trim>);
stoneCutter.addRecipe("dark_oak_drawer_half_4", <item:storagedrawers:dark_oak_half_drawers_4>*2, <item:storagedrawers:oak_trim>);

craftingTable.removeRecipe(<item:storagedrawers:crimson_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:crimson_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:crimson_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:crimson_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:crimson_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:crimson_half_drawers_4>);

stoneCutter.addRecipe("crimson_drawer_1", <item:storagedrawers:crimson_full_drawers_1>, <item:storagedrawers:crimson_trim>);
stoneCutter.addRecipe("crimson_drawer_2", <item:storagedrawers:crimson_full_drawers_2>, <item:storagedrawers:crimson_trim>);
stoneCutter.addRecipe("crimson_drawer_4", <item:storagedrawers:crimson_full_drawers_4>, <item:storagedrawers:crimson_trim>);
stoneCutter.addRecipe("crimson_drawer_half_1", <item:storagedrawers:crimson_half_drawers_1>*2, <item:storagedrawers:crimson_trim>);
stoneCutter.addRecipe("crimson_drawer_half_2", <item:storagedrawers:crimson_half_drawers_2>*2, <item:storagedrawers:crimson_trim>);
stoneCutter.addRecipe("crimson_drawer_half_4", <item:storagedrawers:crimson_half_drawers_4>*2, <item:storagedrawers:crimson_trim>);

craftingTable.removeRecipe(<item:storagedrawers:warped_full_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:warped_full_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:warped_full_drawers_4>);
craftingTable.removeRecipe(<item:storagedrawers:warped_half_drawers_1>);
craftingTable.removeRecipe(<item:storagedrawers:warped_half_drawers_2>);
craftingTable.removeRecipe(<item:storagedrawers:warped_half_drawers_4>);

stoneCutter.addRecipe("warped_drawer_1", <item:storagedrawers:warped_full_drawers_1>, <item:storagedrawers:warped_trim>);
stoneCutter.addRecipe("warped_drawer_2", <item:storagedrawers:warped_full_drawers_2>, <item:storagedrawers:warped_trim>);
stoneCutter.addRecipe("warped_drawer_4", <item:storagedrawers:warped_full_drawers_4>, <item:storagedrawers:warped_trim>);
stoneCutter.addRecipe("warped_drawer_half_1", <item:storagedrawers:warped_half_drawers_1>*2, <item:storagedrawers:warped_trim>);
stoneCutter.addRecipe("warped_drawer_half_2", <item:storagedrawers:warped_half_drawers_2>*2, <item:storagedrawers:warped_trim>);
stoneCutter.addRecipe("warped_drawer_half_4", <item:storagedrawers:warped_half_drawers_4>*2, <item:storagedrawers:oak_trim>);


// templates
craftingTable.removeRecipe(<item:storagedrawers:upgrade_template>);
stoneCutter.addRecipe("oak_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:oak_trim>);
stoneCutter.addRecipe("spruce_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:spruce_trim>);
stoneCutter.addRecipe("birch_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:birch_trim>);
stoneCutter.addRecipe("jungle_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:jungle_trim>);
stoneCutter.addRecipe("acacia_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:acacia_trim>);
stoneCutter.addRecipe("dark_oak_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:dark_oak_trim>);
stoneCutter.addRecipe("crimson_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:crimson_trim>);
stoneCutter.addRecipe("warped_template", <item:storagedrawers:upgrade_template> * 4, <item:storagedrawers:warped_trim>);

// remove some of the metal barrels
craftingTable.removeByModid("metalbarrels");
smithing.removeByModid("metalbarrels");
smithing.addRecipe("iron_barrel", <item:metalbarrels:iron_barrel>, <tag:items:forge:barrels/wooden>, <tag:items:forge:storage_blocks/iron>);
smithing.addRecipe("golden_barrel", <item:metalbarrels:gold_barrel>, <tag:items:forge:barrels/iron>, <tag:items:forge:storage_blocks/gold>);
smithing.addRecipe("diamond_barrel", <item:metalbarrels:diamond_barrel>, <tag:items:forge:barrels/gold>, <tag:items:forge:gems/diamond>);
smithing.addRecipe("netherite_barrel", <item:metalbarrels:netherite_barrel>, <tag:items:forge:barrels/diamond>, <tag:items:forge:ingots/netherite>);

smithing.addRecipe("iron_barrel_upgrade", <item:metalbarrels:wood_to_iron>, <tag:items:minecraft:planks>, <tag:items:forge:storage_blocks/iron>);
smithing.addRecipe("gold_barrel_upgrade", <item:metalbarrels:iron_to_gold>, <tag:items:minecraft:planks>, <tag:items:forge:storage_blocks/gold>);
smithing.addRecipe("diamond_barrel_upgrade", <item:metalbarrels:gold_to_diamond>, <tag:items:minecraft:planks>, <tag:items:forge:gems/diamond>);
//smithing.addRecipe("netherite_barrel_upgrade", <item:metalbarrels:diamond_to_netherite>, <tag:items:minecraft:planks>, <tag:items:forge:ingots/netherite>);
mods.jei.JEI.hideMod("metalbarrels", (name as string) => {
    return (name == "metalbarrels:iron_barrel" 
        || name == "metalbarrels:gold_barrel" 
        || name == "metalbarrels:diamond_barrel" 
        || name == "metalbarrels:netherite_barrel" 
        || name == "metalbarrels:wood_to_iron" 
        || name == "metalbarrels:iron_to_gold"
        || name == "metalbarrels:gold_to_diamond"
        || name == "metalbarrels:diamond_to_netherite");
});