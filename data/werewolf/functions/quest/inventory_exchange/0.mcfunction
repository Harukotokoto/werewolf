## テレポート処理
function werewolf:quest/inventory_exchange/1

## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
tellraw @a {"text":"[システム] クエスト終了: 皆の所持品がすり替えられた…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text