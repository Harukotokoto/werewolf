##データの先頭を保存
data modify storage macro: reserve_3 set from storage macro: reserve_1[0] 


##先頭のプレイヤー名をリストに記録
$execute unless data storage macro: {reserve_3:"$(reserve_0)"} run data modify storage macro: reserve_2 append from storage macro: reserve_1[0]
##数を減算
$execute unless data storage macro: {reserve_3:"$(reserve_0)"} run scoreboard players remove #GameManager reserve_0 1
##リストの先頭を削除
data remove storage macro: reserve_1[0]

##句点
$execute unless data storage macro: {reserve_3:"$(reserve_0)"} unless score #GameManager reserve_0 matches ..0 run data modify storage macro: reserve_2 append value ', '


##再帰
execute if data storage macro: reserve_1[0] unless score #GameManager reserve_0 matches ..0 run function werewolf:.util/role_processing/dummy_role_book_list/0 with storage macro: