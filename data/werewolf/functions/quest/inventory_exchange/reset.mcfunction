## リセット
data modify storage werewolf: gamestate.quest.active set value false

data modify storage werewolf: system.inventory_seal set value true
tag @a remove not_yet_ie
tag @a remove target_ie