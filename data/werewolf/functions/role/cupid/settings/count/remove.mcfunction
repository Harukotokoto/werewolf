#第三陣営は1役職に制限
execute if data storage werewolf: role.cupid{camp:"third"} if data storage werewolf: role.cupid{count:0} run return fail

#共通の前準備
data modify storage macro: reserve_0 set value "cupid"
data modify storage macro: reserve_1 set from storage werewolf: role.cupid.name
data modify storage macro: reserve_2 set from storage werewolf: role.cupid.id

#実行
function werewolf:.util/role_processing/count/.remove with storage macro:

#第三陣営のロック解除
execute if data storage werewolf: role.cupid{camp:"third"} if data storage werewolf: role.cupid{count:0} run data modify storage macro: util.role_processing.third_camp set value 0

#設定画面を更新
function werewolf:role/cupid/settings/ with storage werewolf: role.cupid