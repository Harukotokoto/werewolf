##タスク数設定
tag @e[type=marker,tag=village,tag=task_point,tag=night_task,sort=random,limit=10] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=diamond_ore,sort=random,limit=3] add active_task

##個別処理
execute as @e[type=marker,tag=village,tag=task_point,tag=night_task] at @s run function werewolf:task/field/village/set/cornflower
execute as @e[type=marker,tag=village,tag=task_point,tag=diamond_ore] at @s run function werewolf:task/field/village/set/diamond_ore