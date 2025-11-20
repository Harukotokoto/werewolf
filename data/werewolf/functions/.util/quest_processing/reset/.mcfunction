## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

##内容を初期化
data modify storage macro: util.quest_processing.result set value "result"
data modify storage macro: util.quest_processing.count set value 0

##実行
function werewolf:.util/quest_processing/reset/0 with storage macro: util.quest_processing