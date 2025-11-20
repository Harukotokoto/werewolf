##数値の正常化
# 人数データをスコアボードにコピー
execute store result score #reserve reserve_0 run data get storage werewolf: settings.gamemode.role_count_limit
scoreboard players set #reserve reserve_1 10

# 異常なデータの場合は補正
#0以下の場合
execute if score #reserve reserve_0 matches ..-1 run scoreboard players set #reserve reserve_0 0
#最大値以上の場合
execute if score #reserve reserve_0 > #reserve reserve_1 run scoreboard players operation #reserve reserve_0 = #reserve reserve_1

# 正常化したデータをスコアボードから再入力
execute store result storage werewolf: settings.gamemode.role_count_limit int 1 run scoreboard players get #reserve reserve_0

##表示更新
function werewolf:settings/.menu/others/