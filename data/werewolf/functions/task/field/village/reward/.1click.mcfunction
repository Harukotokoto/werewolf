##reward処理
execute as @s[tag=wheat] if data entity @s attack.player run function werewolf:task/field/village/reward/wheat
execute as @s[tag=red_mushroom] if data entity @s attack.player run function werewolf:task/field/village/reward/red_mushroom
execute as @s[tag=brown_mushroom] if data entity @s attack.player run function werewolf:task/field/village/reward/brown_mushroom
execute as @s[tag=night_task] if data entity @s attack.player run function werewolf:task/field/village/reward/cornflower
execute as @s[tag=treasure_chest] if data entity @s interaction.player run function werewolf:task/field/village/reward/treasure_chest

data remove entity @s attack.player
data remove entity @s interaction.player