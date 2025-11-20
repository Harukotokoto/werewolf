## タスク関連

##1clickタスク
#タスク用のinteraction処理
execute as @e[type=minecraft:interaction,tag=1click_task] at @s if data entity @s attack.player run function werewolf:task/reward/.1click
execute as @e[type=minecraft:interaction,tag=1click_task] at @s if data entity @s interaction.player run function werewolf:task/reward/.1click

##要Switcherタスク
#タスク報酬
function werewolf:task/reward/.common
#scoreboard減算
execute as @a[scores={can_mining_task=1..}] run scoreboard players remove @s can_mining_task 1
execute as @e[type=interaction,tag=task_switcher,scores={can_mining_task=1..}] run scoreboard players remove @s can_mining_task 1
#タスクを破壊可能にする処理
execute as @e[type=interaction,tag=task_switcher] if data entity @s attack.player run function werewolf:task/switcher/on_switcher
#タスクを破壊不可にする処理
execute as @a[scores={can_mining_task=0}] if data entity @s SelectedItem.components."minecraft:can_break".predicates[{blocks:"minecraft:oak_log"}] run item modify entity @s weapon.mainhand werewolf:set_components/can_break/remove
execute as @a[scores={can_mining_task=0}] if data entity @s SelectedItem.components."minecraft:can_break".predicates[{blocks:"minecraft:iron_ore"}] run item modify entity @s weapon.mainhand werewolf:set_components/can_break/remove
execute as @a[scores={can_mining_task=0}] if data entity @s SelectedItem.components."minecraft:can_break".predicates[{blocks:"minecraft:diamond_ore"}] run item modify entity @s weapon.mainhand werewolf:set_components/can_break/remove
execute as @e[type=interaction,tag=task_switcher,scores={can_mining_task=0}] run function werewolf:task/switcher/off_switcher
#消化済みタスク削除
execute as @e[type=marker,tag=active_task,tag=oak_log] at @s align xyz unless block ~ ~ ~ minecraft:oak_log positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
execute as @e[type=marker,tag=active_task,tag=iron_ore] at @s align xyz unless block ~ ~ ~ minecraft:iron_ore positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
execute as @e[type=marker,tag=active_task,tag=diamond_ore] at @s align xyz unless block ~ ~ ~ minecraft:diamond_ore positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]

##夜タスク
#particle
execute if data storage werewolf: gamestate.time{id:night} as @e[type=marker,tag=task_point,tag=active_task,tag=night_task] at @s if entity @e[type=interaction,tag=1click_task,distance=..1] align xyz run particle minecraft:ominous_spawning ~0.5 ~0.5 ~0.5 0.5 0.5 0.5 0 1 force @a