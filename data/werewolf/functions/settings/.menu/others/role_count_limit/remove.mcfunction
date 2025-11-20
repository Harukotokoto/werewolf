##人狼の人数を減算
# storageが用意されていなければ作成
execute unless data storage werewolf: settings.gamemode.role_count_limit run data modify storage werewolf: settings.gamemode.role_count_limit set value 0
# 人狼の人数を減らす
execute store result storage werewolf: settings.gamemode.role_count_limit int 0.999 run data get storage werewolf: settings.gamemode.role_count_limit

# 数値の正常化
function werewolf:settings/.menu/others/role_count_limit/normalize