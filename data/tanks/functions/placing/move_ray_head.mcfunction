tp @s ^ ^ ^0.05
scoreboard players remove @s ES_temp 1
execute at @s if score @s ES_temp matches 0.. unless block ~ ~ ~ player_head unless block ~ ~ ~ player_wall_head run function tanks:placing/move_ray_head
