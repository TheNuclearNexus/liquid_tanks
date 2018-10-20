execute unless score @s ES_stored matches 20.. if entity @e[distance=..2,type=shulker_bullet] run tag @s add fillSB
execute unless score @s ES_stored matches 19.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] run tag @s add fillSB
execute unless score @s ES_stored matches 20.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:potion",tag:{display:{Name:"{\"text\":\"Potion of Clouds\",\"color\":\"white\",\"italic\":false}"},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}],CustomPotionColor:13431807}}}] run tag @s add fillSB
execute unless score @s ES_stored matches 20.. if entity @e[distance=..2,type=shulker_bullet] run tag @s add withSB
execute unless score @s ES_stored matches 19.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] run tag @s add withBuck
execute unless score @s ES_stored matches 20.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:potion",tag:{display:{Name:"{\"text\":\"Potion of Clouds\",\"color\":\"white\",\"italic\":false}"},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}],CustomPotionColor:13431807}}}] run tag @s add withPot
execute if entity @s[tag=fillSB,tag=!withBuck] run scoreboard players add @s ES_stored 1
execute if entity @s[tag=fillSB,tag=withBuck] run scoreboard players add @s ES_stored 2
execute if entity @s[tag=!hasLev,tag=fillSB] run tag @s add hasLev
execute if entity @s[tag=!filled,tag=fillSB] run tag @s add filled
execute if entity @s[tag=fillSB,tag=withSB] run playsound minecraft:enchant.thorns.hit master @a[distance=..5] ~ ~ ~ 1 0
execute if entity @s[tag=fillSB,tag=withSB] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.1 100 normal @a[distance=..5]
execute if entity @s[tag=fillSB,tag=withSB] run kill @e[distance=..2,limit=1,sort=nearest,type=shulker_bullet]
execute if entity @s[tag=fillSB,tag=withPot] run data merge entity @e[limit=1,sort=nearest,distance=..1,type=item,nbt={Item:{id:"minecraft:potion",tag:{display:{Name:"{\"text\":\"Potion of Clouds\",\"color\":\"white\",\"italic\":false}"},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}],CustomPotionColor:13431807}}}] {Tags:["emptied","fixNBT"],Item:{id:"minecraft:glass_bottle"}}
execute if entity @s[tag=fillSB,tag=withBuck] run data merge entity @e[limit=1,sort=nearest,distance=..1,type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] {Tags:["emptied","fixNBT"],Item:{id:"minecraft:bucket"}}
execute if entity @s[tag=fillSB,tag=!withSB] run data remove entity @e[limit=1,sort=nearest,distance=..1,tag=fixNBT] Item.tag
execute if entity @s[tag=fillSB] run tag @s remove fillSB
execute if entity @s[tag=withSB] run tag @s remove withSB
execute if entity @s[tag=withPot] run tag @s remove withPot
execute if entity @s[tag=withBuck] run tag @s remove withBuck

execute if score @s ES_stored matches 1.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add fillCloudBot
execute as @s[tag=fillCloudBot] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:potion",tag:{display:{Name:"{\"text\":\"Potion of Clouds\",\"color\":\"white\",\"italic\":false}"},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}],CustomPotionColor:13431807}}}
execute as @s[tag=fillCloudBot] run scoreboard players remove @s ES_stored 1
execute as @s[tag=fillCloudBot] run tag @s remove fillCloudBot

execute if score @s ES_stored matches 2.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] run tag @s add fillCloudBuck
execute as @s[tag=fillCloudBuck] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:carrot_on_a_stick",tag:{HideFlags:6,Damage:1,Unbreakable:1b,display:{Name:"{\"text\":\"Bucket of Clouds\",\"color\":\"white\",\"italic\":false}"}}}}
execute as @s[tag=fillCloudBuck] run scoreboard players remove @s ES_stored 2
execute as @s[tag=fillCloudBuck] run tag @s remove fillCloudBuck

execute positioned ~ ~.2 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 1.. unless score @s ES_temp matches 1.. run tag @s add applyLev
execute positioned ~ ~.2 ~ if entity @s[tag=applyLev] run effect give @a[distance=..0.5,limit=1,sort=nearest] levitation 5 0 false
execute positioned ~ ~.2 ~ if entity @s[tag=applyLev] run tp @a[distance=..0.5,limit=1,sort=nearest] ~ ~1 ~
execute positioned ~ ~.2 ~ if entity @s[tag=applyLev] run playsound minecraft:entity.generic.drink master @a[distance=..5]
execute positioned ~ ~.2 ~ if entity @s[tag=applyLev] run particle minecraft:end_rod ~ ~-2 ~ 0.1 2 0.1 0 100 normal @a[distance=..5]
execute positioned ~ ~.2 ~ if entity @s[tag=applyLev] run scoreboard players remove @s ES_stored 2
execute positioned ~ ~2 ~ if entity @s[tag=applyLev] run scoreboard players set @s ES_temp 100
execute positioned ~ ~2 ~ if entity @s[tag=applyLev] run tag @s remove applyLev

execute if score @s[tag=hasLev] ES_temp matches 1.. run scoreboard players remove @s ES_temp 1
execute if score @s[tag=hasLev] ES_temp matches 0 run scoreboard players reset @s ES_temp
