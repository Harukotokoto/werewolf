##人狼の人数を加算
# storageが用意されていなければ作成
execute unless data storage werewolf: settings.gamemode.role_count_limit run data modify storage werewolf: settings.gamemode.role_count_limit set value 0

# 人狼の人数を増やす
execute unless data storage werewolf: settings.gamemode{role_count_limit:0} run execute store result storage werewolf: settings.gamemode.role_count_limit int -1 run data get storage werewolf: settings.gamemode.role_count_limit -1.01
execute if data storage werewolf: settings.gamemode{role_count_limit:0} run data modify storage werewolf: settings.gamemode.role_count_limit set value 1

# 数値の正常化
function werewolf:settings/.menu/others/role_count_limit/normalize