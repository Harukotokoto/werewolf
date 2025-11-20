## count_update_mainhand

#残り回数を記録
execute store result score @s reserve_1 run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".count
#減算
scoreboard players remove @s reserve_1 1
#storageに格納
execute store result storage macro: reserve_1 int 1 run scoreboard players get @s reserve_1