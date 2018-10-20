execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}}] if entity @s[tag=!hasDraBre] run tag @s add hasDraBre
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}}] if entity @s[tag=!filled] run tag @s add filled
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}}] if entity @s[tag=!ES_RN_F] run tag @s add ES_RN_F
execute unless score @s ES_stored matches 1.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}}] run data merge block ~ ~ ~ {TransferCooldown: 999999, CustomName: "{\"italic\":false,\"color\":\"aqua\",\"text\":\"Liquid Tank\"}", Items: [{Slot: 0b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b}, {Slot: 1b, id: "minecraft:redstone_torch", Count: 1b, tag: {display: {Lore: ["§r§c§lFalse"], Name: "{\"text\":\"Needs Redstone:\",\"color\":\"gray\",\"italic\":false}"}, gui: 1b}}, {Slot: 2b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b}, {Slot: 3b, id: "minecraft:dragon_breath", Count: 1b, tag: {display: {Name: "{\"text\":\"Release Aura\",\"color\":\"green\",\"italic\":false}"}}}, {Slot: 4b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b}], id: "minecraft:hopper", Lock: ""}
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}}] run scoreboard players add @s ES_stored 2
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}}] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}}] {Tags:["emptied"],Item:{id:"minecraft:glass_bottle"}}

execute if score @s ES_stored matches 2.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add fillDraBre
execute as @s[tag=fillDraBre] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:dragon_breath"}}
execute as @s[tag=fillDraBre] run scoreboard players remove @s ES_stored 2
execute as @s[tag=fillDraBre] run tag @s remove fillDraBre


execute unless block ~ ~ ~ hopper{Items:[{Slot:1b}]} if entity @s[tag=hasDraBre,tag=ES_RN_F,tag=!ES_RN_T] run tag @s add swapT
execute unless block ~ ~ ~ hopper{Items:[{Slot:1b}]} if entity @s[tag=hasDraBre,tag=ES_RN_T,tag=!ES_RN_F] run tag @s add swapF

execute if entity @s[tag=hasDraBre,tag=swapT] run playsound minecraft:ui.button.click master @a[distance=..5]
execute if entity @s[tag=hasDraBre,tag=swapF] run playsound minecraft:ui.button.click master @a[distance=..5]

execute if entity @s[tag=hasDraBre,tag=swapT] run tag @s add ES_RN_T
execute if entity @s[tag=hasDraBre,tag=swapF] run tag @s add ES_RN_F

execute if entity @s[tag=hasDraBre,tag=swapT] run tag @s remove ES_RN_F
execute if entity @s[tag=hasDraBre,tag=swapF] run tag @s remove ES_RN_T

execute if entity @s[tag=hasDraBre,tag=swapT] run tag @s remove swapT
execute if entity @s[tag=hasDraBre,tag=swapF] run tag @s remove swapF

execute if entity @s[tag=ES_RN_T] run replaceitem block ~ ~ ~ container.1 redstone_torch{gui:1b,display:{Name:"{\"text\":\"Needs Redstone:\",\"color\":\"gray\",\"italic\":false}",Lore:["§r§a§lTrue","","§r§fWhen true, power w/ redstone","§r§fto release a dragon breath","§r§faura."]}} 1
execute if entity @s[tag=ES_RN_F] run replaceitem block ~ ~ ~ container.1 redstone_torch{gui:1b,display:{Name:"{\"text\":\"Needs Redstone:\",\"color\":\"gray\",\"italic\":false}",Lore:["§r§c§lFalse","","§r§fWhen true, power w/ redstone","§r§fto release a dragon breath","§r§faura."]}} 1


execute unless block ~ ~ ~ hopper{Items:[{Slot:3b}]} if entity @s[tag=ES_RN_F] if score @s ES_stored matches 4.. unless score @s ES_temp matches 1.. run tag @s add releaseAura
execute if block ~ ~ ~ hopper[enabled=false] if score @s ES_stored matches 4.. if entity @s[tag=ES_RN_T,tag=!justPowered] unless score @s ES_temp matches 1.. run tag @s add releaseAura

execute if entity @s[tag=releaseAura,tag=ES_RN_F] run playsound minecraft:ui.button.click master @a[distance=..5]
execute if entity @s[tag=releaseAura] run summon area_effect_cloud ~ ~ ~ {Particle:"dragon_breath",Radius:3f,Duration:100,Effects:[{Id:7b,Amplifier:1b,Duration:1,ShowParticles:0b}]}
execute if entity @s[tag=releaseAura] run stopsound @a * minecraft:entity.dragon_fireball.explode
execute if entity @s[tag=releaseAura] run particle minecraft:witch ~ ~ ~ 0.5 0 0.5 .1 30 normal @a
execute if entity @s[tag=releaseAura] run playsound minecraft:item.bottle.fill_dragonbreath master @a
execute if entity @s[tag=releaseAura] run playsound minecraft:item.bottle.empty master @a
execute if entity @s[tag=releaseAura] run playsound entity.witch.drink master @a

execute if entity @s[tag=releaseAura] run scoreboard players remove @s ES_stored 2
execute if entity @s[tag=releaseAura] run scoreboard players set @s ES_temp 200

execute if block ~ ~ ~ hopper[enabled=false] if entity @s[tag=releaseAura,tag=ES_RN_T] run tag @s add justPowered
execute if block ~ ~ ~ hopper[enabled=true] if entity @s[tag=ES_RN_T] run tag @s remove justPowered
execute if entity @s[tag=releaseAura] run tag @s remove releaseAura

execute if entity @s[tag=ES_RN_T] run replaceitem block ~ ~ ~ container.3 barrier{gui:1b,display:{Name:"{\"text\":\"Release Aura\",\"color\":\"red\",\"italic\":false}",Lore:["§r§fClick to release aura","","§r§fWon't work if needs","§r§fredstone is true"]}} 1
execute if entity @s[tag=ES_RN_F] unless score @s ES_temp matches 1.. run replaceitem block ~ ~ ~ container.3 dragon_breath{gui:1b,display:{Name:"{\"text\":\"Release Aura\",\"color\":\"green\",\"italic\":false}",Lore:["§r§fClick to release aura","","§r§fWon't work if needs","§r§fredstone is true"]}} 1
execute if entity @s[tag=ES_RN_F] if score @s ES_temp matches 1.. run replaceitem block ~ ~ ~ container.3 barrier{gui:1b,display:{Name:"{\"text\":\"On Cooldown\",\"color\":\"red\",\"italic\":false}",Lore:["§r§f(10 seconds)"]}} 1


execute if score @s[tag=hasDraBre] ES_temp matches 1.. run scoreboard players remove @s ES_temp 1
execute if score @s[tag=hasDraBre] ES_temp matches 0 run scoreboard players reset @s ES_temp


execute if entity @s[tag=hasDraBre] if block ~ ~-1 ~ hopper run setblock ~ ~-1 ~ hopper[enabled=false]
execute if entity @s[tag=hasDraBre] run replaceitem block ~ ~ ~ container.0 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasDraBre] run replaceitem block ~ ~ ~ container.2 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasDraBre] run replaceitem block ~ ~ ~ container.4 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
