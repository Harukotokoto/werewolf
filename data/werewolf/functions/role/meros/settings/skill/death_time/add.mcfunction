##limit_add
execute store result score #GameManager reserve_0 run data get storage werewolf: role.meros.death_time
scoreboard players add #GameManager reserve_0 1

#10以上なら10に
execute if score #GameManager reserve_0 matches 10.. run scoreboard players set #GameManager reserve_0 10

execute store result storage werewolf: role.meros.death_time int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/meros/settings/ with storage werewolf: role.meros