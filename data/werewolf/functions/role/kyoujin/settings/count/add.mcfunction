#第三陣営の場合は1役職に制限
execute if data storage werewolf: role.kyoujin{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run return fail
execute if data storage werewolf: role.kyoujin{camp:"third"} run data modify storage macro: util.role_processing.third_camp set value 1

#共通の前準備
data modify storage macro: reserve_0 set value "kyoujin"
data modify storage macro: reserve_1 set from storage werewolf: role.kyoujin.name
data modify storage macro: reserve_2 set from storage werewolf: role.kyoujin.id

#実行
function werewolf:.util/role_processing/count/.add with storage macro:


#設定画面を更新
function werewolf:role/kyoujin/settings/ with storage werewolf: role.kyoujin