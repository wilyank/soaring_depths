#priority 1

import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.server.MCServer;
import crafttweaker.api.entity.MCLivingEntity;
import crafttweaker.api.util.MCHand;
import crafttweaker.api.util.Random;
import crafttweaker.api.server.MCServer;
import crafttweaker.api.data.MapData;
import crafttweaker.api.util.BlockPos;

// This script contains all event handlers for the pack

var dimList = ["minecraft:overworld", "minecraft:the_nether", "minecraft:the_end"] as stdlib.List<string>;


CTEventManager.register<crafttweaker.api.event.entity.living.MCLivingDeathEvent>(
    (event) => {
        /*
            This event handler saves a player's death location to a scoreboard when the player dies.
            It does not save the location if the player died to void damage. 
            (In that case, there is no point in returning to that location: the drops have fallen into the void.)
        */
        var entity = event.getEntity();
        if (entity.type == <entitytype:minecraft:player>) {
            var world = entity.getWorld();
            var deathPos = entity.getPosition();

            world.asServerWorld().server.executeCommand("scoreboard objectives add s_d.lastDeath.b dummy", true);
            world.asServerWorld().server.executeCommand("scoreboard objectives add s_d.lastDeath.x dummy", true);
            world.asServerWorld().server.executeCommand("scoreboard objectives add s_d.lastDeath.y dummy", true);
            world.asServerWorld().server.executeCommand("scoreboard objectives add s_d.lastDeath.z dummy", true);
            world.asServerWorld().server.executeCommand("scoreboard objectives add s_d.lastDeath.d dummy", true);
            
            world.asServerWorld().server.executeCommand("scoreboard players set " + entity.name + " s_d.lastDeath.x " + deathPos.x, true);
            world.asServerWorld().server.executeCommand("scoreboard players set " + entity.name + " s_d.lastDeath.y " + deathPos.y, true);
            world.asServerWorld().server.executeCommand("scoreboard players set " + entity.name + " s_d.lastDeath.z " + deathPos.z, true);
            world.asServerWorld().server.executeCommand("scoreboard players set " + entity.name + " s_d.lastDeath.d " + dimList.indexOf(world.dimension), true);
            if (event.getSource().type == "outOfWorld") {
                world.asServerWorld().server.executeCommand("scoreboard players set " + entity.name + " s_d.lastDeath.b " + 0, true);
            }
            else {
                world.asServerWorld().server.executeCommand("scoreboard players set " + entity.name + " s_d.lastDeath.b " + 1, true);
            }
        }
    }
);


CTEventManager.register<crafttweaker.api.event.entity.player.MCPlayerRespawnEvent>(
     (event) => {
         /*
            The event handler is triggered when the player respawns 
            and gives them a compass pointing to their last death
            in case a death location is saved.
         */
         if (!event.isEndConquered()) {
            var entity = event.getEntity();
            var world = entity.getWorld();
            if(world.asServerWorld().server.executeCommand("scoreboard players get " + entity.name + " s_d.lastDeath.b") == 1) {
                var x = world.asServerWorld().server.executeCommand("scoreboard players get " + entity.name + " s_d.lastDeath.x");
                var y = world.asServerWorld().server.executeCommand("scoreboard players get " + entity.name + " s_d.lastDeath.y");
                var z = world.asServerWorld().server.executeCommand("scoreboard players get " + entity.name + " s_d.lastDeath.z");
                var dimId = world.asServerWorld().server.executeCommand("scoreboard players get " + entity.name + " s_d.lastDeath.d");
                var displayNBTString = "display:{Name:\'{\"text\":\"Death Compass\",\"italic\":false,\"bold\":true,\"color\":\"gold\"}\'}";
                world.asServerWorld().server.executeCommand("give " + entity.name + " compass{" + displayNBTString + ",LodestoneDimension:'" + dimList[dimId] + "',LodestoneTracked:0b,LodestonePos:{X:" + x + ",Y:" + y + ",Z:" + z + "},IsDeathCompass:true}", true);
                world.asServerWorld().server.executeCommand("scoreboard players set " + entity.name + " s_d.lastDeath.b " + 0, true);
            }
         }
     }
);
CTEventManager.register<crafttweaker.api.event.tick.MCPlayerTickEvent>(
    (event) => {
        /*
            This event handler handles deleting the death compass when 
            1) the death compass is held in the main hand and 
            2) the death location saved on it is reached
        */
        var item = event.getPlayer().getCurrentItem();

        if (event.player.getWorld().remote) {
            return;
        }

        // break if the player is not holding a compass
        if (!(<item:minecraft:compass>.matches(item))) {
            return;
        }

        // break if the player's compass has no data
        if (!item.hasTag) {
            return;
        }
        
        // get the commpass data
        var dataMap = new MapData(item.tag.asMap());
        
        // break if the player's compass is a normal lodestone compass instead of a death compass
        if (!(dataMap.contains("IsDeathCompass"))) {
            return;
        }
        
        // break if the current dimension is different from the one the death compass points to
        var targetDim = dataMap.getAt("LodestoneDimension").getString();
        if (targetDim != event.getPlayer().getWorld().dimension) {
            return;
        }

        // get the location from the compass
        var blockPosMap = new MapData(dataMap.getAt("LodestonePos").asMap());
        var x = blockPosMap.getAt("X").asNumber().getInt();
        var y = blockPosMap.getAt("Y").asNumber().getInt();
        var z = blockPosMap.getAt("Z").asNumber().getInt();

        // break if the target position is far away
        if (!(event.player.getPosition().distanceSq(new BlockPos(x, y, z)) < 100)) {
            return;
        }
        
        // set held item to air
        event.player.getWorld().asServerWorld().server.executeCommand("replaceitem entity " + event.player.name.unformattedComponentText + " weapon air", true);
    }
);

CTEventManager.register<crafttweaker.api.event.block.MCPortalSpawnEvent>(
    (event) => {
        event.cancel();
        println("vanilla portal creation canceled");
    }
);

CTEventManager.register<crafttweaker.api.event.tick.MCPlayerTickEvent>(
    (event) => {
        /* 
            This function sets the player on fire if they are wearing a full set of Ignitium armor 
        */
        var player = event.getPlayer();

        var ignitiumList = [
            <item:cataclysm:ignitium_boots>,
            <item:cataclysm:ignitium_leggings>,
            <item:cataclysm:ignitium_chestplate>,
            <item:cataclysm:ignitium_helmet>
        ];
        var i = 0;
        for armorPiece in player.getArmorInventoryList() {
            if (!ignitiumList[i].matches(armorPiece.asIItemStack())) {
                return;
            }
            i++;
        }
        if (player.getWorld().isRainingAt(player.getPosition())) {
            return;
        }
        player.setFire(1);
    }
);