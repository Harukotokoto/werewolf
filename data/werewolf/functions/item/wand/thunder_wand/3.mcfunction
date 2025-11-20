## 物理演算

execute store result storage item: motion double 0.001 run data get entity @s Motion[0] 1000
execute as @s[tag=motion_x] if data storage item: {motion:0d} run playsound minecraft:item.trident.return master @a ~ ~ ~ 0.3 2 0.0
execute as @s[tag=motion_x] if data storage item: {motion:0d} run data modify entity @s Thrower set from entity @s UUID
execute if data storage item: {motion:0d} store result entity @s Motion[0] double 0.001 run data get entity @s Item.components."minecraft:custom_data".Motion[0] -1000

execute store result storage item: motion double 0.001 run data get entity @s Motion[1] 1000
execute as @s[tag=motion_y] if data storage item: {motion:0d} run playsound minecraft:item.trident.return master @a ~ ~ ~ 0.3 2 0.0
execute as @s[tag=motion_y] if data storage item: {motion:0d} run data modify entity @s Thrower set from entity @s UUID
execute if data storage item: {motion:0d} store result entity @s Motion[1] double 0.001 run data get entity @s Item.components."minecraft:custom_data".Motion[1] -1000

execute store result storage item: motion double 0.001 run data get entity @s Motion[2] 1000
execute as @s[tag=motion_z] if data storage item: {motion:0d} run playsound minecraft:item.trident.return master @a ~ ~ ~ 0.3 2 0.0
execute as @s[tag=motion_z] if data storage item: {motion:0d} run data modify entity @s Thrower set from entity @s UUID
execute if data storage item: {motion:0d} store result entity @s Motion[2] double 0.001 run data get entity @s Item.components."minecraft:custom_data".Motion[2] -1000


data modify entity @s Item.components."minecraft:custom_data".Motion set from entity @s Motion