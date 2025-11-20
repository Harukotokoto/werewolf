## クエストを保存
$data modify storage werewolf: quest_list_shuffle append from storage macro: reserve_0[$(reserve_1)]
## クエストを削除
$data remove storage macro: reserve_0[$(reserve_1)]