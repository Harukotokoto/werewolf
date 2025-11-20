## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/failed
tellraw @a {"text":"[システム] クエスト失敗: オオカミは一匹寂しく立ち去った…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

## おかたづけ
#デスポーンの演出
execute at @e[type=wolf,tag=quest_wolf,tag=no_tame] run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
#狼をキル
execute as @e[type=wolf,tag=quest_wolf,tag=no_tame] unless data entity @s Owner run tp @s ~ ~-1000 ~
execute as @e[type=wolf,tag=quest_wolf,tag=no_tame] unless data entity @s Owner run kill @s
execute as @e[type=interaction,tag=quest_wolf] run kill @s