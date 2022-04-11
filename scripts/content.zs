#loader contenttweaker

import mods.contenttweaker.item.ItemBuilder;
import crafttweaker.api.item.ItemGroup;
import mods.contenttweaker.fluid.FluidBuilder;

ItemGroup.create("soaring_depths", () => <item:create:propeller>);

new ItemBuilder().build("crushed_starmetal_ore");
new ItemBuilder().build("starmetal_nugget");


new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/creeper_essence_still>, <resource:contenttweaker:block/creeper_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("creeper_essence"
);
new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/skeleton_essence_still>, <resource:contenttweaker:block/skeleton_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("skeleton_essence"
);
new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/enderman_essence_still>, <resource:contenttweaker:block/enderman_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("enderman_essence"
);
new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/wither_skeleton_essence_still>, <resource:contenttweaker:block/wither_skeleton_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("wither_skeleton_essence"
);
new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/hoglin_essence_still>, <resource:contenttweaker:block/hoglin_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("hoglin_essence"
);
new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/spider_pig_essence_still>, <resource:contenttweaker:block/spider_pig_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("spider_pig_essence"
);
new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/void_worm_essence_still>, <resource:contenttweaker:block/void_worm_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("void_worm_essence"
);
new FluidBuilder(false, 0x01FFFFFF, <resource:contenttweaker:block/mob_essence_still>, <resource:contenttweaker:block/mob_essence_flow>)
    .density(1600)
    .temperature(360)
    .viscosity(1300)
    .build("mob_essence"
);