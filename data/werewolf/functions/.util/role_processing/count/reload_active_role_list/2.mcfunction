# 処理を記述
##active_role_listに陣営を追加
$data modify storage werewolf: active_role_list append value "$(result)"

execute if data storage macro: util.role_processing{result:"mura"} run return fail

##陣営内人数を更新
#陣営人数をスコアボードに記述
$execute store result score #reserve reserve_0 run data get storage werewolf: camp_details.count.$(camp)
#役職人数をスコアボードに記録
$execute store result score #reserve reserve_1 run data get storage werewolf: role.$(result).count
#役職人数を陣営人数に加算
scoreboard players operation #reserve reserve_0 += #reserve reserve_1
$execute store result storage werewolf: camp_details.count.$(camp) int 1 run scoreboard players get #reserve reserve_0
