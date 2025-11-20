#第三陣営の場合は1役職に制限
execute if data storage werewolf: role.shaman{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run return fail
execute if data storage werewolf: role.shaman{camp:"third"} run data modify storage macro: util.role_processing.third_camp set value 1

#共通の前準備
data modify storage macro: reserve_0 set value "shaman"
data modify storage macro: reserve_1 set from storage werewolf: role.shaman.name
data modify storage macro: reserve_2 set from storage werewolf: role.shaman.id

#実行
function werewolf:.util/role_processing/count/.add with storage macro:


#設定画面を更新
function werewolf:role/shaman/settings/ with storage werewolf: role.shaman