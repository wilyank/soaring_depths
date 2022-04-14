#priority 100

// oredictionary fixes
var forge_gems = <tag:items:forge:gems>;
forge_gems.add(<item:biomesoplenty:nether_crystal>);
forge_gems.add(<item:betterendforge:amber_gem>);
forge_gems.add(<item:astralsorcery:resonating_gem>);
forge_gems.add(<item:eidolon:lesser_soul_gem>);
forge_gems.add(<item:eidolon:shadow_gem>);
forge_gems.add(<item:forbidden_arcanus:rune>);
forge_gems.add(<item:forbidden_arcanus:dark_rune>);

<tag:items:forge:lanterns>.add(<item:minecraft:lantern>);
<tag:items:forge:lanterns>.add(<item:minecraft:soul_lantern>);
<tag:items:forge:lanterns>.add(<item:infernalexp:glow_lantern>);
<tag:items:forge:lanterns>.add(<item:tconstruct:scorched_lantern>);
<tag:items:forge:lanterns>.add(<item:tconstruct:seared_lantern>);

<tag:items:forge:cogwheels>.add(<item:steampowered:bronze_cogwheel>);
<tag:items:forge:cogwheels>.add(<item:steampowered:cast_iron_cogwheel>);
<tag:items:forge:cogwheels>.add(<item:steampowered:steel_cogwheel>);
<tag:items:forge:large_cogwheels>.add(<item:steampowered:bronze_large_cogwheel>);
<tag:items:forge:large_cogwheels>.add(<item:steampowered:bronze_large_cogwheel>);
<tag:items:forge:large_cogwheels>.add(<item:steampowered:steel_large_cogwheel>);

<tag:items:forge:leather>.remove(<item:forbidden_arcanus:rotten_leather>);

<tag:items:forge:wax>.add(<item:forbidden_arcanus:wax>);
<tag:items:forge:wax>.add(<item:eidolon:tallow>);

// fix Eidolon and Forbidden and Arcanus having wildly different ingots with the same name. Renaming is done in the lang files
<tag:items:forge:ingots/arcane_gold>.remove(<item:eidolon:arcane_gold_ingot>);
<tag:items:forge:storage_blocks/arcane_gold>.remove(<item:eidolon:arcane_gold_block>);

<tag:items:forge:ingots/red_gold>.add(<item:eidolon:arcane_gold_ingot>);
<tag:items:forge:storage_blocks/red_gold>.add(<item:eidolon:arcane_gold_block>);


<tag:items:forge:plates>.add(<item:steampowered:bronze_sheet>);
<tag:items:forge:plates/bronze>.add(<item:steampowered:bronze_sheet>);