##count_remove
execute store result score #GameManager reserve_0 run data get storage werewolf: role.wanashi.skill_2.count
scoreboard players remove #GameManager reserve_0 1

#11以上なら10に
execute if score #GameManager reserve_0 matches 11.. run scoreboard players set #GameManager reserve_0 9
#1以下なら1に
execute if score #GameManager reserve_0 matches ..1 run scoreboard players set #GameManager reserve_0 1

execute store result storage werewolf: role.wanashi.skill_2.count int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/wanashi/settings/ with storage werewolf: role.wanashi