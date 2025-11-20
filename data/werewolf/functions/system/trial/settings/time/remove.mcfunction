##cooltime_remove
execute store result score #GameManager reserve_0 run data get storage werewolf: settings.time.trial.tick
scoreboard players remove #GameManager reserve_0 100

#200以下なら200に
execute if score #GameManager reserve_0 matches ..200 run scoreboard players set #GameManager reserve_0 200

execute store result storage werewolf: settings.time.trial.tick int 1 run scoreboard players get #GameManager reserve_0


#秒に変換
scoreboard players set #GameManager reserve_1 20
scoreboard players operation #GameManager reserve_0 /= #GameManager reserve_1

execute store result storage werewolf: settings.time.trial.second int 1 run scoreboard players get #GameManager reserve_0


##暫定で[裁判官]設定に表示
function werewolf:role/saibankan/settings/ with storage werewolf: role.saibankan