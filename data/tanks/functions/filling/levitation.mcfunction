execute unless score @s ES_stored matches 20.. if entity @e[distance=..2,type=shulker_bullet] run tag @s add fillSB
execute unless score @s ES_stored matches 19.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] run tag @s add fillSB
execute unless score @s ES_stored matches 20.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:potion",tag:{display:{Name:"{\"text\":\"Potion of Clouds\",\"color\":\"white\",\"italic\":false}"},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}],CustomPotionColor:13431807}}}] run tag @s add fillSB
execute unless score @s ES_stored matches 20.. if entity @e[distance=..2,type=shulker_bullet] run tag @s add withSB
execute unless score @s ES_stored matches 19.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] run tag @s add withBuck
execute unless score @s ES_stored matches 20.. if entity @e[tag=!filled,distance=..1,type=item,nbt={Item:{id:"minecraft:potion",tag:{display:{Name:"{\"text\":\"Potion of Clouds\",\"color\":\"white\",\"italic\":false}"},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}],CustomPotionColor:13431807}}}] run tag @s add withPot
execute if score @s ES_ID matches 0 if entity @s[tag=fillSB] run scoreboard players set @s ES_ID 4
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=!withBuck] run scoreboard players add @s ES_stored 1
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=withBuck] run scoreboard players add @s ES_stored 2
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=withSB] run playsound minecraft:enchant.thorns.hit master @a[distance=..5] ~ ~ ~ 1 0
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=withSB] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.1 100 normal @a[distance=..5]
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=withSB] run kill @e[distance=..2,limit=1,sort=nearest,type=shulker_bullet]
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=withPot] run data merge entity @e[limit=1,sort=nearest,distance=..1,type=item,nbt={Item:{id:"minecraft:potion",tag:{display:{Name:"{\"text\":\"Potion of Clouds\",\"color\":\"white\",\"italic\":false}"},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}],CustomPotionColor:13431807}}}] {Tags:["emptied","fixNBT"],Item:{id:"minecraft:glass_bottle"}}
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=withBuck] run data merge entity @e[limit=1,sort=nearest,distance=..1,type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] {Tags:["emptied","fixNBT"],Item:{id:"minecraft:bucket"}}
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB,tag=!withSB] run data remove entity @e[limit=1,sort=nearest,distance=..1,tag=fixNBT] Item.tag
execute if score @s ES_ID matches 4 if entity @s[tag=fillSB] run tag @s remove fillSB
execute if score @s ES_ID matches 4 if entity @s[tag=withSB] run tag @s remove withSB
execute if score @s ES_ID matches 4 if entity @s[tag=withPot] run tag @s remove withPot
execute if score @s ES_ID matches 4 if entity @s[tag=withBuck] run tag @s remove withBuck
