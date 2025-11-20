# 処理を記述
# 召喚したチームがwolf,maniac,third以外ならダミープレイヤーを召喚
$execute unless data storage macro: {reserve_1:0} run \
execute unless data storage werewolf: role.$(reserve_0){camp:"wolf"} unless data storage werewolf: role.$(reserve_0){camp:"maniac"} unless data storage werewolf: role.$(reserve_0){camp:"third"} run summon minecraft:armor_stand ~ ~ ~ {Team:$(reserve_0),Marker:true,Invisible:true,NoGravity:true,Tags:["job_change_villager_role"]}

# データが無ければreturn
$execute unless data storage werewolf: active_role_list[$(reserve_1)] run return run data modify storage macro: reserve_1 set value 0

# 再帰後の処理対象を更新
$data modify storage macro: reserve_0 set from storage werewolf: active_role_list[$(reserve_1)]
# カウントアップ
execute unless data storage macro: {reserve_1:0} run execute store result storage macro: reserve_1 int -1 run data get storage macro: reserve_1 -1.01
execute if data storage macro: {reserve_1:0} run data modify storage macro: reserve_1 set value 1


# 再帰処理
function werewolf:item/job_change_villager/0 with storage macro: