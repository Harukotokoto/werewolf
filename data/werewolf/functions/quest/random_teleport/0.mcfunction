## テレポート処理
function werewolf:quest/random_teleport/1

## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
tellraw @a {"text":"[システム] クエスト終了: 皆の位置が入れ替わった…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text