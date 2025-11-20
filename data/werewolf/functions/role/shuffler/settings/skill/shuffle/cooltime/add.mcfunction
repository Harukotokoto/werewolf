##cooltime_add
execute store result score #GameManager reserve_0 run data get storage werewolf: role.shuffler.skill_2.cooltime
scoreboard players add #GameManager reserve_0 100

#6000以上なら6000に
execute if score #GameManager reserve_0 matches 6000.. run scoreboard players set #GameManager reserve_0 6000

execute store result storage werewolf: role.shuffler.skill_2.cooltime int 1 run scoreboard players get #GameManager reserve_0


#秒に変換
scoreboard players set #GameManager reserve_1 20
scoreboard players operation #GameManager reserve_0 /= #GameManager reserve_1

execute store result storage werewolf: role.shuffler.skill_2.cooltime_second int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/shuffler/settings/ with storage werewolf: role.shuffler