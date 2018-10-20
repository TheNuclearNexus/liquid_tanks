execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}}] if entity @s[tag=!hasWater] run tag @s add hasWater
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}}] if entity @s[tag=!filled] run tag @s add filled
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}}] if entity @s[tag=!ES_FC_F] run tag @s add ES_FC_F

execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}}] run scoreboard players add @s ES_stored 2
execute unless score @s ES_stored matches 19.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}}] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:water_bucket",Count:1b}}] {Tags:["emptied"],Item:{id:"minecraft:bucket"}}

execute unless score @s ES_stored matches 20.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}}] if entity @s[tag=!hasWater] run tag @s add hasWater
execute unless score @s ES_stored matches 20.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}}] if entity @s[tag=!filled] run tag @s add filled
execute unless score @s ES_stored matches 20.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}}] run scoreboard players add @s ES_stored 1
execute unless score @s ES_stored matches 20.. if entity @e[distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:water"}}}] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:potion",Count:1b}}] {Tags:["emptied"],Item:{id:"minecraft:glass_bottle"}}


execute if score @s ES_stored matches 2.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] run tag @s add fillWaterBuck
execute as @s[tag=fillWaterBuck] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:bucket",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:water_bucket"}}
execute as @s[tag=fillWaterBuck] run scoreboard players remove @s ES_stored 2
execute as @s[tag=fillWaterBuck] run tag @s remove fillWaterBuck

execute if score @s ES_stored matches 1.. if entity @e[distance=..1,tag=!emptied,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add fillWaterBot
execute as @s[tag=fillWaterBot] run data merge entity @e[limit=1,distance=..1,tag=!filled,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] {Tags:["filled"],Item:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}}
execute as @s[tag=fillWaterBot] run scoreboard players remove @s ES_stored 1
execute as @s[tag=fillWaterBot] run tag @s remove fillWaterBot


execute unless block ~ ~ ~ hopper{Items:[{Slot:2b}]} if entity @s[tag=hasWater,tag=ES_FC_F,tag=!ES_FC_T] run tag @s add swapT
execute unless block ~ ~ ~ hopper{Items:[{Slot:2b}]} if entity @s[tag=hasWater,tag=ES_FC_T,tag=!ES_FC_F] run tag @s add swapF

execute if entity @s[tag=hasWater,tag=swapT] run playsound minecraft:ui.button.click master @a[distance=..5]
execute if entity @s[tag=hasWater,tag=swapF] run playsound minecraft:ui.button.click master @a[distance=..5]

execute if entity @s[tag=hasWater,tag=swapT] run tag @s add ES_FC_T
execute if entity @s[tag=hasWater,tag=swapF] run tag @s add ES_FC_F

execute if entity @s[tag=hasWater,tag=swapT] run tag @s remove ES_FC_F
execute if entity @s[tag=hasWater,tag=swapF] run tag @s remove ES_FC_T

execute if entity @s[tag=hasWater,tag=swapT] run tag @s remove swapT
execute if entity @s[tag=hasWater,tag=swapF] run tag @s remove swapF

execute if entity @s[tag=ES_FC_T] run replaceitem block ~ ~ ~ container.2 redstone_torch{gui:1b,display:{Name:"{\"text\":\"Mode:\",\"color\":\"gray\",\"italic\":false}",Lore:["§r§7§lFill","","§r§fIt will fill any","§r§fcauldron below it"]}} 1
execute if entity @s[tag=ES_FC_F] run replaceitem block ~ ~ ~ container.2 redstone_torch{gui:1b,display:{Name:"{\"text\":\"Mode:\",\"color\":\"gray\",\"italic\":false}",Lore:["§r§7§lExtinguish","","§r§fIt will put out any","§r§fplayer below it"]}} 1


execute if entity @s[tag=hasWater,tag=ES_FC_T] if score @s ES_stored matches 2.. unless score @s ES_temp matches 1.. if block ~ ~-1 ~ cauldron run tag @s add fillCauldron
execute if entity @s[tag=fillCauldron] if block ~ ~-1 ~ cauldron[level=0] run scoreboard players remove @s ES_stored 2
execute if entity @s[tag=fillCauldron] if block ~ ~-1 ~ cauldron[level=0] run scoreboard players set @s ES_temp 200
execute if entity @s[tag=fillCauldron] if block ~ ~-1 ~ cauldron[level=0] run playsound minecraft:item.bucket.fill block @a[distance=..5]
execute if entity @s[tag=fillCauldron] if block ~ ~-1 ~ cauldron[level=0] run setblock ~ ~-1 ~ cauldron[level=3]
execute if entity @s[tag=fillCauldron] unless block ~ ~-1 ~ cauldron[level=0] run tag @s remove fillCauldron

execute if entity @s[tag=hasWater,tag=ES_FC_F] if score @s ES_stored matches 2.. unless score @s ES_temp matches 1.. if block ~ ~-1 ~ air positioned ~ ~-1.6 ~ if entity @a[distance=..0.5] run tag @s add extinguish
execute if entity @s[tag=extinguish] run setblock ~ ~-1 ~ water[level=0]
execute if entity @s[tag=extinguish] run setblock ~ ~-1 ~ air
execute if entity @s[tag=extinguish] run scoreboard players set @s ES_temp 200
execute if entity @s[tag=extinguish] run scoreboard players remove @s ES_stored 2
execute if entity @s[tag=extinguish] run playsound minecraft:item.bucket.empty block @a[distance=..5]
execute if entity @s[tag=extinguish] run tag @s remove extinguish

execute if entity @s[tag=hasWater] if block ~ ~-1 ~ hopper run setblock ~ ~-1 ~ hopper[enabled=false]
execute if entity @s[tag=hasWater] run replaceitem block ~ ~ ~ container.0 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasWater] run replaceitem block ~ ~ ~ container.1 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasWater] run replaceitem block ~ ~ ~ container.3 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}
execute if entity @s[tag=hasWater] run replaceitem block ~ ~ ~ container.4 light_gray_stained_glass_pane{gui:1b,display:{Name:"{\"text\":\"\"}"}}


execute if entity @s[tag=hasWater] if score @s ES_temp matches 1.. run scoreboard players remove @s ES_temp 1
execute if entity @s[tag=hasWater] if score @s ES_temp matches 0 run scoreboard players reset @s ES_temp
