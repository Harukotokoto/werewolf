## リセット
data modify storage werewolf: gamestate.quest.active set value false

execute as @e[type=wolf,tag=quest_wolf,tag=wimw] at @s run particle minecraft:cloud ~0.5 ~0.5 ~0.5 1 1 1 0 5 force @a
execute as @e[type=villager,tag=wolf_owner] at @s run particle minecraft:cloud ~0.5 ~0.5 ~0.5 1 1 1 0 5 force @a

execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run data modify entity @s Owner set from entity @s UUID
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run tp @s ~ ~-1000 ~
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run kill @s
execute as @e[type=interaction,tag=quest_wolf] run kill @s

execute as @e[type=villager,tag=wolf_owner] run tp @s ~ ~-1000 ~
execute as @e[type=villager,tag=wolf_owner] run kill @s