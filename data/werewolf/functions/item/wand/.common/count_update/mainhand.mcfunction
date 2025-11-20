## count_update_mainhand

#残り回数を記録
execute store result score @s reserve_0 run data get entity @s SelectedItem.components."minecraft:custom_data".count
#減算
scoreboard players remove @s reserve_0 1
#storageに格納
execute store result storage macro: reserve_0 int 1 run scoreboard players get @s reserve_0