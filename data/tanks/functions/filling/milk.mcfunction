execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:milk_bucket",Count:1b}}] if entity @s[tag=!hasMilk] run tag @s add hasMilk
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:milk_bucket",Count:1b}}] if entity @s[tag=!filled] run tag @s add filled
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:milk_bucket",Count:1b}}] run scoreboard players add @s ES_stored 2
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:milk_bucket",Count:1b}}] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:milk_bucket",Count:1b}}] {Tags:["emptied"],Item:{id:"minecraft:bucket"}}

execute if score @s ES_stored matches 2.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] run tag @s add fillMilkBuck
execute as @s[tag=fillMilkBuck] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:milk_bucket"}}
execute as @s[tag=fillMilkBuck] run scoreboard players remove @s ES_stored 2
execute as @s[tag=fillMilkBuck] run tag @s remove fillMilkBuck

execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 2.. unless score @s ES_temp matches 1.. run effect clear @a[distance=..0.5,limit=1,sort=nearest]
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 2.. unless score @s ES_temp matches 1.. run playsound minecraft:entity.generic.drink master @a
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 2.. unless score @s ES_temp matches 1.. run particle minecraft:block white_concrete ~ ~1.6 ~ 0.5 0 0.5 0 100 normal
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 2.. unless score @s ES_temp matches 1.. run scoreboard players remove @s ES_stored 2
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 2.. unless score @s ES_temp matches 1.. run scoreboard players set @s ES_temp 100

execute if score @s[tag=hasMilk] ES_temp matches 1.. run scoreboard players remove @s ES_temp 1
execute if score @s[tag=hasDraMilk] ES_temp matches 0 run scoreboard players reset @s ES_temp
