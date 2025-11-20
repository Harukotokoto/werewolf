##reward処理
execute as @s[tag=night_task] if data entity @s attack.player run function werewolf:task/field/village/reward/cornflower
execute as @s[tag=treasure_chest] if data entity @s interaction.player run function werewolf:task/field/village/reward/treasure_chest

data remove entity @s attack.player
data remove entity @s interaction.player