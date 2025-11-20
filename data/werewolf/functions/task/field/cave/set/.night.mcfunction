##タスク数設定
tag @e[type=marker,tag=village,tag=task_point,tag=night_task,sort=random,limit=10] add active_task

##個別処理
execute as @e[type=marker,tag=village,tag=task_point,tag=night_task] at @s run function werewolf:task/field/village/set/cornflower