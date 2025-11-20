#第三陣営は1役職に制限
execute if data storage werewolf: role.kyouyuu{camp:"third"} if data storage werewolf: role.kyouyuu{count:0} run return fail
execute if data storage werewolf: role.kyouyuu{camp:"third"} run data modify storage macro: util.role_processing.third_camp set value 0

#共通の前準備
data modify storage macro: reserve_0 set value "kyouyuu"
data modify storage macro: reserve_1 set from storage werewolf: role.kyouyuu.name
data modify storage macro: reserve_2 set from storage werewolf: role.kyouyuu.id

#実行
function werewolf:.util/role_processing/count/.remove with storage macro:


#設定画面を更新
function werewolf:role/kyouyuu/settings/ with storage werewolf: role.kyouyuu