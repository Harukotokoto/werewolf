##初期化
execute at @e[type=marker,tag=task_point,tag=!treasure_chest] run setblock ~ ~ ~ air
kill @e[type=item_display,tag=dummy_task]
kill @e[type=item_display,tag=select_block]
kill @e[type=block_display,tag=dummy_task]
kill @e[type=block_display,tag=night_task]
kill @e[type=interaction,tag=1click_task]
kill @e[type=interaction,tag=task_switcher]
tag @e[type=marker,tag=task_point,tag=active_task] remove active_task
function animated_java:treasure_chest/remove/all
execute as @e[tag=task_mob] run tp ~ ~-1000 ~
kill @e[tag=task_mob]

##ゲーム中ならreturn
execute if data storage werewolf: {phase:"playing"} run return fail

##フィールドごとの処理
#village
function werewolf:task/field/village/reset
#cave
function werewolf:task/field/cave/reset