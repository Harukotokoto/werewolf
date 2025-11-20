#第三陣営は1役職に制限
execute if data storage werewolf: role.soujiya{camp:"third"} if data storage werewolf: role.soujiya{count:0} run return fail
execute if data storage werewolf: role.soujiya{camp:"third"} run data modify storage macro: util.role_processing.third_camp set value 0

#共通の前準備
data modify storage macro: reserve_0 set value "soujiya"
data modify storage macro: reserve_1 set from storage werewolf: role.soujiya.name
data modify storage macro: reserve_2 set from storage werewolf: role.soujiya.id

#実行
function werewolf:.util/role_processing/count/.remove with storage macro:


#設定画面を更新
function werewolf:role/soujiya/settings/ with storage werewolf: role.soujiya