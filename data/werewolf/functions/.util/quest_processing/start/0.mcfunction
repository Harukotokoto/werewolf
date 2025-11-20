## 実行準備
execute unless data storage werewolf: quest_list_shuffle[0] run return fail
data modify storage macro: reserve_0 set from storage werewolf: quest_list_shuffle[0]
function werewolf:.util/quest_processing/start/1 with storage macro: