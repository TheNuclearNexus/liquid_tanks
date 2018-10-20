execute unless score @s ES_stored matches 10000.. positioned ~ ~.4 ~ if entity @a[distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] unless entity @a[nbt={XpTotal:0},distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] if entity @s[tag=!hasXP] run tag @s add hasXP
execute unless score @s ES_stored matches 10000.. positioned ~ ~.4 ~ if entity @a[distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] unless entity @a[nbt={XpTotal:0},distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] if entity @s[tag=!filled] run tag @s add filled
execute unless score @s ES_stored matches 10000.. positioned ~ ~.4 ~ if entity @a[distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] unless entity @a[nbt={XpTotal:0},distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] if score @s ES_stored matches 1 if entity @s[tag=!ES_CM_T] run tag @s remove ES_CM_F
execute unless score @s ES_stored matches 10000.. positioned ~ ~.4 ~ if entity @a[distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] unless entity @a[nbt={XpTotal:0},distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] if entity @s[tag=!ES_CM_T] run tag @s add ES_CM_T
execute unless score @s ES_stored matches 10000.. positioned ~ ~.4 ~ if entity @s[tag=ES_CM_T] if entity @a[distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] unless entity @a[nbt={XpTotal:0},distance=..0.7,scores={ES_sneakTime=1..},limit=1,sort=nearest] run tag @s add depositXP
execute unless score @s ES_stored matches 10000.. positioned ~ ~.4 ~ if entity @s[tag=ES_CM_F] if entity @a[distance=..0.7,limit=1,sort=nearest] unless entity @a[nbt={XpTotal:0},distance=..0.7,limit=1,sort=nearest] run tag @s add depositXP
execute if entity @s[tag=hasXP,tag=depositXP] run scoreboard players add @s ES_stored 1
execute if entity @s[tag=hasXP,tag=depositXP] run particle block lime_glazed_terracotta ~ ~.3 ~ 0.5 0 0.5 0 10 normal
execute if entity @s[tag=hasXP,tag=depositXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 1..5 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 2
execute if entity @s[tag=hasXP,tag=depositXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 6..10 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 1.6
execute if entity @s[tag=hasXP,tag=depositXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 11..15 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 1
execute if entity @s[tag=hasXP,tag=depositXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 16..20 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 0.6
execute if entity @s[tag=hasXP,tag=depositXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 21..25 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 0
execute if entity @s[tag=hasXP,tag=depositXP] run xp add @a[distance=..0.7,limit=1,sort=nearest] -1
execute if entity @s[tag=hasXP,tag=depositXP] run tag @s remove depositXP
execute unless score @s ES_stored matches 10000.. if entity @e[type=experience_orb,distance=..3,tag=!return] run scoreboard players add @s ES_stored 1
execute unless score @s ES_stored matches 10000.. if entity @e[type=experience_orb,distance=..3,tag=!return] run kill @e[type=experience_orb,distance=..3,limit=1,tag=!return]

execute if score @s ES_stored matches 1.. positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] run tag @s add withdrawXP
execute if entity @s[tag=withdrawXP] positioned ~ ~-1.6 ~ if entity @a[distance=..0.5,limit=1,sort=nearest] run xp add @a[distance=..0.5,limit=1,sort=nearest] 1
execute if entity @s[tag=withdrawXP] positioned ~ ~-1.6 ~ if entity @a[distance=..0.5,limit=1,sort=nearest] run scoreboard players remove @s ES_stored 1
execute if entity @s[tag=withdrawXP] run particle block lime_glazed_terracotta ~ ~.3 ~ 0.5 0 0.5 0 10 normal
execute if entity @s[tag=withdrawXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 1..5 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 2
execute if entity @s[tag=withdrawXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 6..10 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 1.6
execute if entity @s[tag=withdrawXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 11..15 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 1
execute if entity @s[tag=withdrawXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 16..20 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 0.6
execute if entity @s[tag=withdrawXP] if score XPTimer ES_temp matches 19.. if score XPSound ES_temp matches 21..25 run playsound minecraft:entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 9 0
execute if entity @s[tag=withdrawXP] positioned ~ ~-1.6 ~ if entity @a[distance=..0.5,limit=1,sort=nearest] run tag @s remove withdrawXP

execute unless block ~ ~ ~ hopper{Items:[{Slot:2b}]} if entity @s[tag=hasXP,tag=ES_CM_F,tag=!ES_CM_T] run tag @s add swapT
execute unless block ~ ~ ~ hopper{Items:[{Slot:2b}]} if entity @s[tag=hasXP,tag=ES_CM_T,tag=!ES_CM_F] run tag @s add swapF

execute if entity @s[tag=hasXP,tag=swapT] run playsound minecraft:ui.button.click master @a[distance=..5]
execute if entity @s[tag=hasXP,tag=swapF] run playsound minecraft:ui.button.click master @a[distance=..5]

execute if entity @s[tag=hasXP,tag=swapT] run tag @s add ES_CM_T
execute if entity @s[tag=hasXP,tag=swapF] run tag @s add ES_CM_F

execute if entity @s[tag=hasXP,tag=swapT] run tag @s remove ES_CM_F
execute if entity @s[tag=hasXP,tag=swapF] run tag @s remove ES_CM_T

execute if entity @s[tag=hasXP,tag=swapT] run tag @s remove swapT
execute if entity @s[tag=hasXP,tag=swapF] run tag @s remove swapF

execute if entity @s[tag=ES_CM_T] run replaceitem block ~ ~ ~ container.2 redstone_torch{gui:1b,display:{Name:"{\"text\":\"Crouch Mode:\",\"color\":\"gray\",\"italic\":false}",Lore:["§r§a§lTrue","","§r§fWhen true, sneak on","§r§ftop to deposit XP"]}} 1
execute if entity @s[tag=ES_CM_F] run replaceitem block ~ ~ ~ container.2 redstone_torch{gui:1b,display:{Name:"{\"text\":\"Crouch Mode:\",\"color\":\"gray\",\"italic\":false}",Lore:["§r§c§lFalse","","§r§fWhen true, sneak on","§r§ftop to deposit XP"]}} 1

execute if entity @s[tag=hasXP] if block ~ ~-1 ~ hopper run setblock ~ ~-1 ~ hopper[enabled=false]
execute if entity @s[tag=hasXP] run replaceitem block ~ ~ ~ container.0 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasXP] run replaceitem block ~ ~ ~ container.1 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasXP] run replaceitem block ~ ~ ~ container.3 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasXP] run replaceitem block ~ ~ ~ container.4 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
