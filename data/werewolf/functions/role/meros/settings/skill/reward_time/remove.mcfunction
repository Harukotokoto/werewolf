##cooltime_remove
execute store result score #GameManager reserve_0 run data get storage werewolf: role.meros.reward_time
scoreboard players remove #GameManager reserve_0 1

#10以上なら10に
execute if score #GameManager reserve_0 matches 10.. run scoreboard players set #GameManager reserve_0 10
#1以下なら1に
execute if score #GameManager reserve_0 matches ..1 run scoreboard players set #GameManager reserve_0 1

execute store result storage werewolf: role.meros.reward_time int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/meros/settings/ with storage werewolf: role.meros