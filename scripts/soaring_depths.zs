import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.MCItemDefinition;
import stdlib.List;

// this scripts does random tweaks and fixes

// end portal
craftingTable.removeRecipe(<item:minecraft:end_portal_frame>);
craftingTable.addShaped("end_portal_frame", <item:minecraft:end_portal_frame>, [[<item:minecraft:air>, <item:minecraft:ender_pearl>, <item:minecraft:air>],[<item:eidolon:shadow_gem>,<item:forbidden_arcanus:end_crystal_gem>, <item:eidolon:shadow_gem>], [<item:infernalexp:glowstone_bricks>, <item:infernalexp:glowstone_bricks>, <item:infernalexp:glowstone_bricks>]]);

// oredictionary fixes
var forge_gems = <tag:items:forge:gems>;
forge_gems.add(<item:biomesoplenty:nether_crystal>);
forge_gems.add(<item:betterendforge:amber_gem>);
<tag:items:forge:leather>.remove(<item:forbidden_arcanus:rotten_leather>);

// BOP sand casts
craftingTable.addShapeless("wite_sand_cast", <item:tconstruct:blank_sand_cast>*4, [<item:biomesoplenty:white_sand>]);
craftingTable.addShapeless("orange_sand_cast", <item:tconstruct:blank_red_sand_cast>*4, [<item:biomesoplenty:orange_sand>]);

// remove rail duping exploit with tinker's construct
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ingot_1");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/iron/ingot_6_16");
<recipetype:tconstruct:melting>.removeByName("tconstruct:smeltery/melting/metal/gold/powered_rail");

// add cobalt crystal melting into cobalt
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_shard_melting", <item:outer_end:cobalt_crystal_shard>, <fluid:tconstruct:molten_cobalt>, 950, 10);
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_melting", <item:outer_end:cobalt_crystal>, <fluid:tconstruct:molten_cobalt>*4, 950, 40);
<recipetype:tconstruct:melting>.addMeltingRecipe("cobalt_crystal_lamp_melting", <item:outer_end:cobalt_crystal_lamp>, <fluid:tconstruct:molten_cobalt>*4, 950, 40);

// make soul sand and liquid soul automatable
<recipetype:tconstruct:casting_basin>.addItemCastingRecipe("sand_to_soul_sand", <item:minecraft:sand>, <fluid:tconstruct:blood> * 250, <item:minecraft:soul_sand>, 200, true, false);
<recipetype:tconstruct:melting>.addMeltingRecipe("soul_melting", <item:forbidden_arcanus:soul>, <fluid:tconstruct:liquid_soul> * 1000, 200, 500);
<recipetype:tconstruct:melting>.addMeltingRecipe("dark_soul_melting", <item:forbidden_arcanus:dark_soul>, <fluid:tconstruct:liquid_soul> * 2000, 200, 500);
mods.jei.JEI.addInfo(<item:forbidden_arcanus:soul>, ["Use a Soul Extracter on Soul Sand to get a soul."]);

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

// fix Eidolon and Forbidden and Arcanus having wildly different ingots with the same name. Renaming is done in the lang files
<tag:items:forge:ingots/arcane_gold>.remove(<item:eidolon:arcane_gold_ingot>);
<tag:items:forge:ingots/redstone_gold>.add(<item:eidolon:arcane_gold_ingot>);
