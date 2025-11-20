## リセット
data modify storage werewolf: gamestate.quest.active set value false
tp @e[type=axolotl,tag=quest_axolotl,tag=quest] ~ ~-1000 ~
kill @e[type=axolotl,tag=quest_axolotl,tag=quest]
kill @e[type=interaction,tag=quest_axolotl,tag=boss,tag=quest]