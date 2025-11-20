# 処理を記述
$execute unless data storage macro: {reserve_1:0} run \
execute unless data storage werewolf: role.$(reserve_0){dummy:false} run summon minecraft:armor_stand ~ ~ ~ {Team:$(reserve_0),Marker:true,Invisible:true,NoGravity:true,Tags:["ponkotsu_role"]}

#dummy_wolfがfalse,召喚したチームがwolfならキル
$execute unless data storage macro: {reserve_1:0} run \
execute if data storage werewolf: role.ponkotsu{dummy_wolf:false} if data storage werewolf: role.$(reserve_0){camp:"wolf"} run kill @e[type=armor_stand,tag=ponkotsu_role,team=$(reserve_0)]

# データが無ければreturn
$execute unless data storage werewolf: active_role_list[$(reserve_1)] run return run data modify storage macro: reserve_1 set value 0

# 再帰後の処理対象を更新
$data modify storage macro: reserve_0 set from storage werewolf: active_role_list[$(reserve_1)]
# カウントアップ
execute unless data storage macro: {reserve_1:0} run execute store result storage macro: reserve_1 int -1 run data get storage macro: reserve_1 -1.01
execute if data storage macro: {reserve_1:0} run data modify storage macro: reserve_1 set value 1


# 再帰処理
function werewolf:role/ponkotsu/skill/0 with storage macro: