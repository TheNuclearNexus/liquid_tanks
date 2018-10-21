#execute as @s[scores={ES_useCOAS=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:1,Unbreakable:1b}}}] at @s positioned ~ ~1.61 ~ unless score @s ES_temp matches 1.. store success score @s ES_temp unless block ^ ^ ^1 air align xyz positioned ^ ^ ^ run summon area_effect_cloud ~.5 ~0.2 ~.5 {Particle:"entity_effect",Radius:1f,Duration:200,Color:13431807,Effects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}]}
execute if block ~ ~ ~ player_head{Owner:{Id:"45c44468-2286-4bee-8713-f83df63a0446"}} run tag @s add ES_found
execute if block ~ ~ ~ player_wall_head{Owner:{Id:"45c44468-2286-4bee-8713-f83df63a0446"}} run tag @s add ES_found
execute if entity @s[tag=ES_found] align xyz run setblock ~ ~ ~ air
execute if entity @s[tag=ES_found] run kill @e[sort=nearest,type=item,nbt={Item:{tag:{SkullOwner:{Id:"45c44468-2286-4bee-8713-f83df63a0446"}}}}]
execute if entity @s[tag=ES_found] align xyz run summon area_effect_cloud ~.5 ~0.2 ~.5 {Particle:"entity_effect",Radius:1f,Duration:200,Color:13431807,Effects:[{Id:25b,Amplifier:0b,Duration:200,ShowParticles:1b}]}
execute if entity @s[tag=ES_found] run give @p[tag=placedHead,gamemode=!creative] bucket 1
execute if entity @s[tag=ES_found] run tag @p[tag=placedHead] remove placedHead
execute if entity @s[tag=ES_found] run playsound minecraft:item.bucket.empty block @a[distance=..5] ~ ~ ~
