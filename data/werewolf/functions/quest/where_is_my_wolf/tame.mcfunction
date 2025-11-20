## tame

data modify entity @e[type=wolf,tag=quest_wolf,tag=wimw,limit=1] Owner set from entity @s UUID

execute as @e[type=interaction,tag=quest_wolf] at @s run particle minecraft:heart ~ ~0.3 ~ 0.3 0.3 0.3 0 5 force @a

execute as @e[type=interaction,tag=quest_wolf] run kill @s
