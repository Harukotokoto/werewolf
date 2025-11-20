##ブロックを設置
execute as @e[type=marker,tag=village,tag=task_point,tag=oak_log] at @s run setblock ~ ~ ~ oak_log
execute as @e[type=marker,tag=village,tag=task_point,tag=iron_ore] at @s run setblock ~ ~ ~ stone
execute as @e[type=marker,tag=village,tag=task_point,tag=wheat] at @s align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:wheat",Properties:{age:"7"}},Tags:["dummy_task"]}
execute as @e[type=marker,tag=village,tag=task_point,tag=red_mushroom] at @s align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:red_mushroom"},Tags:["dummy_task"]}
execute as @e[type=marker,tag=village,tag=task_point,tag=brown_mushroom] at @s align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:brown_mushroom"},Tags:["dummy_task"]}
execute as @e[type=marker,tag=village,tag=task_point,tag=night_task] at @s run setblock ~ ~ ~ air
execute as @e[type=marker,tag=village,tag=task_point,tag=diamond_ore] at @s run setblock ~ ~ ~ deepslate