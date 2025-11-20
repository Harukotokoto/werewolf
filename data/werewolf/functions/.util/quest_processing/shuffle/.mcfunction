## リストをコピー
data modify storage macro: reserve_0 set from storage werewolf: quest_list
## リストを保存するstorageを掃除
data remove storage werewolf: quest_list_shuffle

## ランダムに並び替え
function werewolf:.util/quest_processing/shuffle/0