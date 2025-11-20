##偽プレイヤー選択処理
#欲しいデータ数をあらかじめ#GameManager reserve_0に用意

##自分のIDを記録
execute at @s run function werewolf:.util/get_name/

##リストのコピーを用意
data modify storage macro: reserve_1 set from storage werewolf: player_list

##使用するstorageをきれいに
data remove storage macro: reserve_2


##リスト作成(自身のIDは除く)
function werewolf:.util/role_processing/dummy_role_book_list/0 with storage macro:


## tellrawサンプル
#tellraw @s [{"interpret":true,"nbt":"reserve_2","storage":"macro:"}]