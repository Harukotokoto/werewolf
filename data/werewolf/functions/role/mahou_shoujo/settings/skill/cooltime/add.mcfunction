##cooltime_add
execute store result score #GameManager reserve_0 run data get storage werewolf: role.mahou_shoujo.skill_2.cooltime
scoreboard players add #GameManager reserve_0 100

#1200以上なら1200に
execute if score #GameManager reserve_0 matches 1200.. run scoreboard players set #GameManager reserve_0 1200

execute store result storage werewolf: role.mahou_shoujo.skill_2.cooltime int 1 run scoreboard players get #GameManager reserve_0


#秒に変換
scoreboard players set #GameManager reserve_1 20
scoreboard players operation #GameManager reserve_0 /= #GameManager reserve_1

execute store result storage werewolf: role.mahou_shoujo.skill_2.cooltime_second int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/mahou_shoujo/settings/ with storage werewolf: role.mahou_shoujo