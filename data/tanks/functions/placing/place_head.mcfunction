tag @s add placedHead
scoreboard players set @s ES_placeHead 0

summon area_effect_cloud ~ ~ ~ {Tags:["ES_head_ray"],Duration:0}
tp @e[tag=ES_head_ray] ~ ~1.61 ~ ~ ~
execute as @e[tag=ES_head_ray] at @s run function tanks:placing/start_ray_head
