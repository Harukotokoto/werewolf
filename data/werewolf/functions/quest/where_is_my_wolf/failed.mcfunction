## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/failed
tellraw @a {"text":"[システム] クエスト失敗: 狼と飼い主は立ち去った…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

## おかたづけ
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] at @s run particle minecraft:cloud ~0.5 ~0.5 ~0.5 1 1 1 0 5 force @a
execute as @e[type=villager,tag=wolf_owner] at @s run particle minecraft:cloud ~0.5 ~0.5 ~0.5 1 1 1 0 5 force @a

execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run data modify entity @s Owner set from entity @s UUID
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run tp @s ~ ~-1000 ~
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run kill @s
execute as @e[type=interaction,tag=quest_wolf] run kill @s

execute as @e[type=villager,tag=wolf_owner] run tp @s ~ ~-1000 ~
execute as @e[type=villager,tag=wolf_owner] run kill @s