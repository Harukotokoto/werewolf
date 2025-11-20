# 処理を記述
$execute unless data storage macro: {reserve_1:0} run \
execute if entity @s[tag=team_$(reserve_0)] run return run data modify storage macro: reserve_0 set value "$(reserve_0)"

# データが無ければreturn
$execute unless data storage werewolf: active_role_list[$(reserve_1)] run return run data modify storage macro: reserve_1 set value 0

# 再帰後の処理対象を更新
$data modify storage macro: reserve_0 set from storage werewolf: active_role_list[$(reserve_1)]
# カウントアップ
execute unless data storage macro: {reserve_1:0} run execute store result storage macro: reserve_1 int -1 run data get storage macro: reserve_1 -1.01
execute if data storage macro: {reserve_1:0} run data modify storage macro: reserve_1 set value 1


# 再帰処理
function werewolf:.util/role_processing/get_role_dead/0 with storage macro: