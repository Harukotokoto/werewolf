## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
tellraw @a {"text":"[システム] クエスト完了: 鮭達は海へ帰っていった…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

##おかたづけ
tp @e[type=salmon,tag=quest_salmon,tag=quest] ~ ~-1000 ~
kill @e[type=salmon,tag=quest_salmon,tag=quest]