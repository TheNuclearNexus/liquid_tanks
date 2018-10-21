execute if score @s ES_ID matches 3 if score @s ES_stored matches 2.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] run tag @s add fillLavaBuck
execute as @s[tag=fillLavaBuck] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:lava_bucket"}}
execute as @s[tag=fillLavaBuck] run scoreboard players remove @s ES_stored 2
execute as @s[tag=fillLavaBuck] run tag @s remove fillLavaBuck
