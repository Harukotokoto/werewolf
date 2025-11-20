#第三陣営の場合は1役職に制限
execute if data storage werewolf: role.cupid{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} unless data storage werewolf: {active_role_list:["cupid"]} run return run function werewolf:role/cupid/settings/ with storage werewolf: role.cupid
execute if data storage werewolf: role.cupid{camp:"third"} run data modify storage macro: util.role_processing.third_camp set value 1

#共通の前準備
data modify storage macro: reserve_0 set value "cupid"
data modify storage macro: reserve_1 set from storage werewolf: role.cupid.name
data modify storage macro: reserve_2 set from storage werewolf: role.cupid.id

#実行
function werewolf:.util/role_processing/count/.add with storage macro:


#設定画面を更新
function werewolf:role/cupid/settings/ with storage werewolf: role.cupid