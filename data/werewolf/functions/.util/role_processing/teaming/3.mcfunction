# 処理データを更新
$data modify storage macro: util.role_processing.number set from storage werewolf: role.$(result).count
$data modify storage macro: util.role_processing.camp set from storage werewolf: role.$(result).camp

# 処理を記述
execute unless data storage macro: util.role_processing{count:0} run \
function werewolf:.util/role_processing/teaming/4 with storage macro: util.role_processing

# データが無ければreturn
$execute unless data storage werewolf: active_role_list[$(count)] run return run data modify storage macro: util.role_processing.count set value 0


# 再帰後の処理対象を更新
$data modify storage macro: util.role_processing.result set from storage werewolf: active_role_list[$(count)]

# カウントアップ
execute unless data storage macro: util.role_processing{count:0} run execute store result storage macro: util.role_processing.count int -1 run data get storage macro: util.role_processing.count -1.01
execute if data storage macro: util.role_processing{count:0} run data modify storage macro: util.role_processing.count set value 1


# 再帰処理
function werewolf:.util/role_processing/teaming/3 with storage macro: util.role_processing