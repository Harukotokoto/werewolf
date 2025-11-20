##cooltime_add
execute store result score #GameManager reserve_0 run data get storage werewolf: role.meros.reward_time
scoreboard players add #GameManager reserve_0 1

#20以上なら20に
execute if score #GameManager reserve_0 matches 20.. run scoreboard players set #GameManager reserve_0 20

execute store result storage werewolf: role.meros.reward_time int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/meros/settings/ with storage werewolf: role.meros