#第三陣営の場合は1役職に制限
execute if data storage werewolf: role.teruteru{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} unless data storage werewolf: {active_role_list:["teruteru"]} run return run function werewolf:role/teruteru/settings/ with storage werewolf: role.teruteru
execute if data storage werewolf: role.teruteru{camp:"third"} run data modify storage macro: util.role_processing.third_camp set value 1

#共通の前準備
data modify storage macro: reserve_0 set value "teruteru"
data modify storage macro: reserve_1 set from storage werewolf: role.teruteru.name
data modify storage macro: reserve_2 set from storage werewolf: role.teruteru.id

#実行
function werewolf:.util/role_processing/count/.add with storage macro:


#設定画面を更新
function werewolf:role/teruteru/settings/ with storage werewolf: role.teruteru