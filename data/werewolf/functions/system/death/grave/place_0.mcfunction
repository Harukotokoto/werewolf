## IDを記録
execute store result storage macro: reserve_0 int 1 run scoreboard players get @s ID

## 設置
execute as @s at @s run function werewolf:system/death/grave/place_1 with storage macro: