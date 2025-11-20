##使用するstorageをきれいに
data remove storage werewolf: player_list

##参加プレイヤーリストを作成
execute as @a[tag=player,sort=random] at @s run function werewolf:.util/get_name_list/0