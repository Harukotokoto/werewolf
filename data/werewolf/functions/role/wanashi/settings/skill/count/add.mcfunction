##count_add
execute store result score #GameManager reserve_0 run data get storage werewolf: role.wanashi.skill_2.count
scoreboard players add #GameManager reserve_0 1

#10以上なら999に
execute if score #GameManager reserve_0 matches 10.. run scoreboard players set #GameManager reserve_0 999

execute store result storage werewolf: role.wanashi.skill_2.count int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/wanashi/settings/ with storage werewolf: role.wanashi