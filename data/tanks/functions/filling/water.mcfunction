execute unless score @s ES_ID matches 2.. unless score @s ES_stored matches 19.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}},tag=!filled] if entity @s[tag=!ES_FC_F] run tag @s add ES_FC_F
execute unless score @s ES_ID matches 2.. unless score @s ES_stored matches 19.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}},tag=!filled] run scoreboard players set @s ES_ID 1

execute if score @s ES_ID matches 1 unless score @s ES_stored matches 19.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}},tag=!filled] run scoreboard players add @s ES_stored 2
execute if score @s ES_ID matches 1 unless score @s ES_stored matches 19.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}},tag=!filled] run data merge entity @e[limit=1,distance=..1,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}},tag=!filled] {Tags:["emptied"],Item:{id:"minecraft:bucket"}}


execute unless score @s ES_ID matches 2.. unless score @s ES_stored matches 20.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}},tag=!filled] if entity @s[tag=!ES_FC_F] run tag @s add ES_FC_F
execute unless score @s ES_ID matches 2.. unless score @s ES_stored matches 20.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}},tag=!filled] run scoreboard players set @s ES_ID 1

execute if score @s ES_ID matches 1 unless score @s ES_stored matches 20.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}},tag=!filled] run scoreboard players add @s ES_stored 1
execute if score @s ES_ID matches 1 unless score @s ES_stored matches 20.. if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}},tag=!filled] run data merge entity @e[limit=1,distance=..1,type=item,nbt={Item:{id:"minecraft:potion",Count:1b}}] {Tags:["emptied"],Item:{id:"minecraft:glass_bottle"}}
