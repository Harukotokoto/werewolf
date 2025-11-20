##役職人数を加算
# 役職用storageが用意されていなければ作成
$execute unless data storage werewolf: role.$(reserve_0).count run data modify storage werewolf: role.$(reserve_0).count set value 0

# 役職の最大人数を増やす
$execute unless data storage werewolf: role.$(reserve_0){count:0} run execute store result storage werewolf: role.$(reserve_0).count int -1 run data get storage werewolf: role.$(reserve_0).count -1.01
$execute if data storage werewolf: role.$(reserve_0){count:0} run data modify storage werewolf: role.$(reserve_0).count set value 1