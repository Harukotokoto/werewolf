## 新商品追加処理
function werewolf:quest/add_job_change_item_villager/1

## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス

#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text