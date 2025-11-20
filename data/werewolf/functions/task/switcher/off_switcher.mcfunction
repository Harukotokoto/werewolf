scoreboard players reset @s can_mining_task
data modify entity @s width set value 1.0001
data modify entity @s height set value 1.0001

execute as @s at @s if block ~ ~1 ~ air run kill @s