execute at @s if entity @s[scores={ES_ID=1}] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Water\",\"color\":\"blue\"}"}
#execute at @s if entity @s[tag=hasLava] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Lava\",\"color\":\"gold\"}"}
#execute at @s if entity @s[tag=hasMilk] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Milk\",\"color\":\"gray\"}"}
execute at @s if entity @s[scores={ES_ID=2}] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Dragon's Breath\",\"color\":\"light_purple\"}"}
#execute at @s if entity @s[tag=hasXP] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Experience\",\"color\":\"green\"}"}
#execute at @s if entity @s[tag=hasLev] if entity @a[distance=..10] positioned ~ ~.4 ~ unless entity @e[type=area_effect_cloud,distance=..0.3] run summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1b,Particle:"block",Radius:0f,Duration:99,CustomName:"{\"text\":\"Levitation\",\"color\":\"aqua\"}"}
