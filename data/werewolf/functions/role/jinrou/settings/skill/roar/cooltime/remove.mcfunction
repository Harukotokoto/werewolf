##cooltime_remove
execute store result score #GameManager reserve_0 run data get storage werewolf: role.jinrou.skill_2.cooltime
scoreboard players remove #GameManager reserve_0 100

#100以下なら100に
execute if score #GameManager reserve_0 matches ..100 run scoreboard players set #GameManager reserve_0 100

execute store result storage werewolf: role.jinrou.skill_2.cooltime int 1 run scoreboard players get #GameManager reserve_0


#秒に変換
scoreboard players set #GameManager reserve_1 20
scoreboard players operation #GameManager reserve_0 /= #GameManager reserve_1

execute store result storage werewolf: role.jinrou.skill_2.cooltime_second int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/jinrou/settings/ with storage werewolf: role.jinrou