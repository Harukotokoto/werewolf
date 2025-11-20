##limit_remove
execute store result score #GameManager reserve_0 run data get storage werewolf: role.assassin.skill_0.limit
scoreboard players remove #GameManager reserve_0 1

#6以上なら5に
execute if score #GameManager reserve_0 matches 6.. run scoreboard players set #GameManager reserve_0 5
#1以下なら1に
execute if score #GameManager reserve_0 matches ..1 run scoreboard players set #GameManager reserve_0 1

execute store result storage werewolf: role.assassin.skill_0.limit int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/assassin/settings/ with storage werewolf: role.assassin