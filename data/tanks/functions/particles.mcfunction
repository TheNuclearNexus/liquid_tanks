#Particles
execute at @s if entity @s[scores={ES_ID=1}] run particle dripping_water ~ ~1.1 ~ 0.1 0 0.1 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[scores={ES_ID=3}] run particle lava ~ ~1.1 ~ 0.1 0 0.1 0.1 1 normal @a[distance=..5]
execute at @s if entity @s[tag=hasMilk] run particle block white_concrete ~ ~1.1 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[tag=hasXP] run particle block lime_glazed_terracotta ~ ~1.1 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[tag=hasLev] run particle end_rod ~ ~1.1 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[scores={ES_ID=2}] run particle witch ~ ~.9 ~ 0 0 0 0.1 3 normal @a[distance=..5]
execute at @s if entity @s[scores={ES_ID=2}] if score XPTimer ES_temp matches 10..11 if score @s ES_temp matches 51..200 run particle witch ~ ~1 ~ 0 0 0 0.1 10 normal @a[distance=..5]
execute at @s if entity @s[scores={ES_ID=2}] if score XPTimer ES_temp matches 11..20 if score @s ES_temp matches 51..200 run particle witch ~ ~1 ~ 0 0 0 0.1 10 normal @a[distance=..5]
