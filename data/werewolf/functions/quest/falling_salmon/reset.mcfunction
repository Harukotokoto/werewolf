## リセット
data modify storage werewolf: gamestate.quest.active set value false
tp @e[type=salmon,tag=quest_salmon,tag=quest] ~ ~-1000 ~
kill @e[type=salmon,tag=quest_salmon,tag=quest]