execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] if entity @s[tag=!hasLava] run tag @s add hasLava
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] if entity @s[tag=!filled] run tag @s add filled
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] run scoreboard players add @s ES_stored 2
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] {Tags:["emptied"],Item:{id:"minecraft:bucket"}}

execute if score @s ES_stored matches 2.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] run tag @s add fillLavaBuck
execute as @s[tag=fillLavaBuck] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:lava_bucket"}}
execute as @s[tag=fillLavaBuck] run scoreboard players remove @s ES_stored 2
execute as @s[tag=fillLavaBuck] run tag @s remove fillLavaBuck
