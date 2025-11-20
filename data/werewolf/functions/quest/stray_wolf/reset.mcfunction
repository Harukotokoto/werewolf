## リセット
data modify storage werewolf: gamestate.quest.active set value false
execute as @e[type=wolf,tag=quest_wolf] run data modify entity @s Owner set from entity @s UUID
execute as @e[type=wolf,tag=quest_wolf] run tp @s ~ ~-1000 ~
execute as @e[type=wolf,tag=quest_wolf] run kill @s
execute as @e[type=interaction,tag=quest_wolf] run kill @s