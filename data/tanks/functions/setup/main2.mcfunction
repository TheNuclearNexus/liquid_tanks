execute as @s at @s run function #tanks:tanks_tick

execute at @s[scores={ES_ID=0}] run data merge block ~ ~ ~ {CustomName: "{\"italic\":false,\"color\":\"aqua\",\"text\":\"Liquid Tank\"}", Items: [{Slot: 0b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 1b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 2b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 3b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}, {Slot: 4b, id: "minecraft:light_gray_stained_glass_pane", Count: 1b, tag: {display: {Name: "{\"text\":\"\"}"}, gui: 1b}}], id: "minecraft:hopper", Lock: ""}

data merge entity @s {Fire:100s}

execute unless score @s ES_ID matches 1.. run scoreboard players set @s ES_ID 0
execute at @s run data merge block ~ ~ ~ {TransferCooldown:999999}
execute at @s if entity @s[tag=hasXP] if block ~ ~ ~ air run summon experience_orb ~ ~1 ~ {Tags:["return"],Health:10b}
execute at @s if entity @s[tag=hasXP] if block ~ ~ ~ air store result entity @e[type=experience_orb,sort=nearest,limit=1] Value short 1 run scoreboard players get @s ES_stored
execute at @s if block ~ ~ ~ air run kill @s

#Tagging
execute as @s[scores={ES_stored=..0}] run function #tanks:tanks_when_empty
execute as @s[scores={ES_stored=..0}] run scoreboard players set @s ES_ID 0
execute as @s[scores={ES_stored=..0}] run scoreboard players set @s ES_maxAmnt 0
execute if score @s ES_stored matches ..0 run scoreboard players reset @s ES_temp

execute if score @s ES_ID matches 1 run scoreboard players set @s ES_maxAmnt 21
execute if score @s ES_ID matches 2..5 run scoreboard players set @s ES_maxAmnt 20
execute if score @s ES_ID matches 6 run scoreboard players set @s ES_maxAmnt 10000
execute if score @s ES_ID matches 7..9 run scoreboard players set @s ES_maxAmnt 20

#functions
execute as @s at @s run function #tanks:tanks_fill

#Naming
execute at @s if entity @s[scores={ES_ID=0}] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Empty\",\"color\":\"white\"}"}
execute as @s at @s if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run function #tanks:tanks_names

#Head Change
execute as @s[scores={ES_ID=0}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:glass",Count:1b}]}
execute as @s at @s run function #tanks:tanks_heads

execute as @s at @s if score XPTimer ES_temp matches 19..20 run function #tanks:tanks_particles
