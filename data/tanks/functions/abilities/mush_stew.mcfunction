execute if score @s ES_stored matches 2.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:bowl",Count:1b}}] run tag @s add fillMushBowl
execute as @s[tag=fillMushBowl] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:bowl",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:mushroom_stew"}}
execute as @s[tag=fillMushBowl] run scoreboard players remove @s ES_stored 2
execute as @s[tag=fillMushBowl] run tag @s remove fillMushBowl

execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 1.. unless score @s ES_temp matches 1.. run effect give @a[distance=..0.5,limit=1,sort=nearest] saturation 1 2
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 1.. unless score @s ES_temp matches 1.. run playsound minecraft:entity.generic.drink master @a
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 1.. unless score @s ES_temp matches 1.. run particle minecraft:block brown_mushroom_block ~ ~1.6 ~ 0.5 0 0.5 0 100 normal
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 1.. unless score @s ES_temp matches 1.. run scoreboard players remove @s ES_stored 1
execute positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] if score @s ES_stored matches 1.. unless score @s ES_temp matches 1.. run scoreboard players set @s ES_temp 100

execute if score @s[scores={ES_ID=7}] ES_temp matches 1.. run scoreboard players remove @s ES_temp 1
execute if score @s[scores={ES_ID=7}] ES_temp matches 0 run scoreboard players reset @s ES_temp
