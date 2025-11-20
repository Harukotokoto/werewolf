## 落盤処理
function werewolf:quest/cave_in/1 with storage werewolf: settings

## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
tellraw @a {"text":"[システム] クエスト終了: 落盤が起きたようだ…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text