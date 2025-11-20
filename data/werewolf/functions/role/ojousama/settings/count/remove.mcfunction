#第三陣営は1役職に制限
execute if data storage werewolf: role.ojousama{camp:"third"} if data storage werewolf: role.ojousama{count:0} run return fail
execute if data storage werewolf: role.ojousama{camp:"third"} run data modify storage macro: util.role_processing.third_camp set value 0

#共通の前準備
data modify storage macro: reserve_0 set value "ojousama"
data modify storage macro: reserve_1 set from storage werewolf: role.ojousama.name
data modify storage macro: reserve_2 set from storage werewolf: role.ojousama.id

#実行
function werewolf:.util/role_processing/count/.remove with storage macro:


#設定画面を更新
function werewolf:role/ojousama/settings/ with storage werewolf: role.ojousama