scoreboard players set @s ES_temp 120
function tanks:placing/move_ray_head
execute at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function tanks:placing/cloud_bucket
kill @s
