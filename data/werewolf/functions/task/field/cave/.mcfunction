## タスク関連

##1clickタスク
#タスク用のinteraction処理
execute as @e[type=minecraft:interaction,tag=1click_task] at @s if data entity @s attack.player run function werewolf:task/reward/.1click
execute as @e[type=minecraft:interaction,tag=1click_task] at @s if data entity @s interaction.player run function werewolf:task/reward/.1click