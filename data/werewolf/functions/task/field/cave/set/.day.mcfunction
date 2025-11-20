##初期化
function werewolf:task/reset

##タスク数設定
tag @e[type=marker,tag=cave,tag=task_point,tag=mob,sort=random,limit=45] add active_task
tag @e[type=marker,tag=cave,tag=task_point,tag=treasure_chest,sort=random,limit=5] add active_task

##個別処理
execute as @e[type=marker,tag=cave,tag=task_point,tag=mob] at @s run function werewolf:task/field/cave/set/mob
execute as @e[type=marker,tag=cave,tag=task_point,tag=treasure_chest] at @s run function werewolf:task/field/cave/set/treasure_chest