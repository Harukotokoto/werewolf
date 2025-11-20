# 処理を記述
#役職人数をスコアボードに記述
$execute store result score #reserve reserve_1 run data get storage werewolf: role.$(result).count
#役職人数を加算
scoreboard players operation #reserve reserve_0 += #reserve reserve_1