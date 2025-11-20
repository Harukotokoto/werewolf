##役職人数を減算
# 役職の最大人数を減らす
$execute store result storage werewolf: role.$(reserve_0).count int 0.999 run data get storage werewolf: role.$(reserve_0).count

# 数値の正常化
function werewolf:.util/role_processing/count/normalize with storage macro: