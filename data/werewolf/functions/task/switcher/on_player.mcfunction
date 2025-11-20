scoreboard players set @s can_mining_task 25
execute if data entity @s SelectedItem{id:"minecraft:iron_pickaxe"} run item modify entity @s weapon.mainhand werewolf:set_components/can_break/set_ores
execute if data entity @s SelectedItem{id:"minecraft:iron_axe"} run item modify entity @s weapon.mainhand werewolf:set_components/can_break/set_oak_log

advancement revoke @s only werewolf:player_hurt_entity/task/task_swicher