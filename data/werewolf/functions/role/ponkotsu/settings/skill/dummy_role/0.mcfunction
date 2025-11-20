# 処理を記述
$execute unless data storage macro: util.role_processing{count:0} \
unless data storage werewolf: role.$(result){display_dummy_settings:false} run \
function werewolf:role/ponkotsu/settings/skill/dummy_role/1 with storage macro: util.role_processing


# データが無ければreturn
$execute unless data storage werewolf: role_list[$(count)] run return run data modify storage macro: util.role_processing.count set value 0


# 再帰後の処理対象を更新
$data modify storage macro: util.role_processing.result set from storage werewolf: role_list[$(count)]
# カウントアップ
execute unless data storage macro: util.role_processing{count:0} run execute store result storage macro: util.role_processing.count int -1 run data get storage macro: util.role_processing.count -1.01
execute if data storage macro: util.role_processing{count:0} run data modify storage macro: util.role_processing.count set value 1


# 再帰処理
function werewolf:role/ponkotsu/settings/skill/dummy_role/0 with storage macro: util.role_processing