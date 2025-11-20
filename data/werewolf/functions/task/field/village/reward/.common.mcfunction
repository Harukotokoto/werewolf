execute as @a[scores={mined.oak_log=1..}] run function werewolf:task/field/village/reward/oak_log
execute as @a[scores={mined.iron_ore=1..}] run function werewolf:task/field/village/reward/iron_ore
execute as @a[scores={mined.diamond_ore=1..}] run function werewolf:task/field/village/reward/diamond_ore


scoreboard players set @a mined.oak_log 0
scoreboard players set @a mined.iron_ore 0
scoreboard players set @a mined.diamond_ore 0


