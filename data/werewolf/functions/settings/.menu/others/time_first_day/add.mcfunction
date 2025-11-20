##cooltime_add
execute store result score #GameManager reserve_0 run data get storage werewolf: settings.time.first_day.tick
scoreboard players add #GameManager reserve_0 100

#12000以上なら12000に
execute if score #GameManager reserve_0 matches 12000.. run scoreboard players set #GameManager reserve_0 12000

execute store result storage werewolf: settings.time.first_day.tick int 1 run scoreboard players get #GameManager reserve_0


#秒に変換
scoreboard players set #GameManager reserve_1 20
scoreboard players operation #GameManager reserve_0 /= #GameManager reserve_1

execute store result storage werewolf: settings.time.first_day.second int 1 run scoreboard players get #GameManager reserve_0


##表示更新
function werewolf:settings/.menu/others/