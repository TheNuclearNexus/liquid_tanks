execute as @e[tag=ES_tank] run function tanks:setup/main2

execute as @a[tag=!builder,nbt={Inventory:[{id:"minecraft:structure_void"}]}] run give @s minecraft:hopper{display:{Name:"{\"text\":\"Liquid Tank\",\"color\":\"aqua\",\"italic\":false}"}} 1
execute as @a[tag=!builder,nbt={Inventory:[{id:"minecraft:structure_void"}]}] run clear @s minecraft:structure_void 1

#Storage Display
execute as @a[scores={ES_useHop=1..}] at @s run function tanks:get_lu
execute as @a at @s positioned ~ ~-1 ~ if entity @e[tag=ES_tank,distance=..1,scores={ES_ID=6}] run title @s actionbar ["",{"text":"<","color":"gray"},{"score":{"name":"@e[scores={ES_ID=6},sort=nearest,distance=..3,tag=ES_tank,limit=1]","objective":"ES_stored"},"color":"green","bold":true},{"text":"> XP Points","color":"gray"}]
#sneak detect
scoreboard players set @a ES_sneakTime 0
#ES Timer
scoreboard players add XPTimer ES_temp 1
execute if score XPTimer ES_temp matches 20.. run scoreboard players set XPTimer ES_temp 0
scoreboard players add XPSound ES_temp 1
execute if score XPSound ES_temp matches 25.. run scoreboard players set XPSound ES_temp 1
#Clear
clear @a[tag=!ES_dev] redstone_torch{gui:1b}
clear @a[tag=!ES_dev] dragon_breath{gui:1b}
clear @a[tag=!ES_dev] barrier{gui:1b}

clear @a[tag=!ES_dev] light_gray_stained_glass_pane{gui:1b}
kill @e[nbt={Item:{tag:{gui:1b}}}]

execute as @a[scores={ES_placeHop=1..}] run scoreboard players set @s ES_temp 20
execute as @a[scores={ES_placeHop=1..}] run scoreboard players reset @s ES_placeHop

execute as @a[scores={ES_temp=1..}] run function tanks:placing/liquid_tank

execute as @a if score @s ES_temp matches 1.. run scoreboard players remove @s ES_temp 1
execute as @a if score @s ES_temp matches 0 run scoreboard players reset @s ES_temp
