##初期化
function werewolf:task/reset

##タスク数設定
tag @e[type=marker,tag=village,tag=task_point,tag=oak_log,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=iron_ore,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=wheat,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=red_mushroom,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=brown_mushroom,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=treasure_chest,sort=random,limit=5] add active_task

##個別処理
execute as @e[type=marker,tag=village,tag=task_point,tag=oak_log] at @s run function werewolf:task/field/village/set/oak_log
execute as @e[type=marker,tag=village,tag=task_point,tag=iron_ore] at @s run function werewolf:task/field/village/set/iron_ore
execute as @e[type=marker,tag=village,tag=task_point,tag=wheat] at @s run function werewolf:task/field/village/set/wheat
execute as @e[type=marker,tag=village,tag=task_point,tag=red_mushroom] at @s run function werewolf:task/field/village/set/red_mushroom
execute as @e[type=marker,tag=village,tag=task_point,tag=brown_mushroom] at @s run function werewolf:task/field/village/set/brown_mushroom
execute as @e[type=marker,tag=village,tag=task_point,tag=treasure_chest] at @s run function werewolf:task/field/village/set/treasure_chest