#Advancements

#Crafting Liquid Tank
advancement grant @a[nbt={Inventory: [{Slot: 0b, id: "minecraft:hopper", Count: 1b, tag: {display: {Name: "{\"text\":\"Liquid Tank\",\"color\":\"aqua\",\"italic\":false}"}}}]}] only tanks:craft_liquidtank

#Milker
execute at @e[type=armor_stand,tag=ES_tank] as @a[distance=..5,nbt={SelectedItem: {id: "minecraft:milk_bucket", Count: 1b}}] run advancement grant @s only tanks:milker

#Fireman
execute at @e[type=armor_stand,tag=ES_FC_F] as @a[distance=..5] run advancement grant @s only tanks:fireman

#Dragon Breath
execute at @e[type=armor_stand,tag=ES_tank] as @a[distance=..5,nbt={SelectedItem: {id: "minecraft:dragon_breath", Count: 1b}}] run advancement grant @s only tanks:draconic

#Shulker
execute as @e[nbt={ArmorItems: [{}, {}, {}, {id: "minecraft:player_head", Count: 1b, tag: {SkullOwner: {Id: "b2fa08e4-918e-4c3e-925e-5830fa96ca53", Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2I2ZGI5ODBhNTI0OTYwOTdkZmE4ZDU3ZGZiOTlkOGIxMjAxMTljNzExMzgzNThhNGRhMjliZWYwNmExZDZjMSJ9fX0="}]}}}}]}] at @s run advancement grant @a[distance=..5] only tanks:levitation

#Experience Saver
execute at @e[type=armor_stand,tag=ES_CM_T,scores={ES_stored=10000..}] as @a[distance=..5] run advancement grant @s only tanks:experience