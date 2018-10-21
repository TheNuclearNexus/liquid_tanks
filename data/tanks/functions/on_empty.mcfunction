execute if score @s ES_stored matches ..0 if entity @s[scores={ES_ID=1}] run tag @s remove ES_FC_T
execute if score @s ES_stored matches ..0 if entity @s[scores={ES_ID=1}] run tag @s remove ES_FC_F
execute at @s if score @s ES_stored matches ..0 if entity @s[scores={ES_ID=1}] run setblock ~ ~ ~ hopper[enabled=true]{TransferCooldown:1,CustomName:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Liquid Tank\"}"}
execute if score @s ES_stored matches ..0 if entity @s[scores={ES_ID=2}] run tag @s remove ES_RN_T
execute if score @s ES_stored matches ..0 if entity @s[scores={ES_ID=2}] run tag @s remove ES_RN_F
execute at @s if score @s ES_stored matches ..0 if entity @s[scores={ES_ID=2}] run setblock ~ ~ ~ hopper[enabled=true]{TransferCooldown:1,CustomName:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Liquid Tank\"}"}
execute if score @s ES_stored matches ..0 if entity @s[tag=hasXP] run tag @s remove ES_CM_T
execute if score @s ES_stored matches ..0 if entity @s[tag=hasXP] run tag @s remove ES_CM_F
execute at @s if score @s ES_stored matches ..0 if entity @s[tag=hasXP] run setblock ~ ~ ~ hopper[enabled=true]{TransferCooldown:1,CustomName:"{\"italic\":false,\"color\":\"aqua\",\"text\":\"Liquid Tank\"}"}
