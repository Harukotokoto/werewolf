##ボタンアイテムを再配置
execute as @s[scores={ui_ready=0}] run loot replace entity @s container.11 loot werewolf:inventory_ui/buttons/slot_11
execute as @s[scores={ui_ready=1}] run loot replace entity @s container.11 loot werewolf:inventory_ui/buttons/slot_11_1
