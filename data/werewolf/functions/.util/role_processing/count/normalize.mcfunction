##数値の正常化
# 人数データをスコアボードにコピー
$execute store result score #reserve reserve_0 run data get storage werewolf: role.$(reserve_0).count
$execute store result score #reserve reserve_1 run data get storage werewolf: role.$(reserve_0).count_max

# 異常なデータの場合は補正
#0以下の場合
execute if score #reserve reserve_0 matches ..-1 run scoreboard players set #reserve reserve_0 0
#最大値以上の場合
execute if score #reserve reserve_0 > #reserve reserve_1 run scoreboard players operation #reserve reserve_0 = #reserve reserve_1

# 正常化したデータをスコアボードから再入力
$execute store result storage werewolf: role.$(reserve_0).count int 1 run scoreboard players get #reserve reserve_0

# 正常化したデータを用意
$data modify storage macro: reserve_3 set from storage werewolf: role.$(reserve_0).count