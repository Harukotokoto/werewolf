##cooltime_add
execute store result score #GameManager reserve_0 run data get storage werewolf: role.shinigami.skill_0.cooltime
scoreboard players add #GameManager reserve_0 1

#6以上なら5に
execute if score #GameManager reserve_0 matches 6.. run scoreboard players set #GameManager reserve_0 5

execute store result storage werewolf: role.shinigami.skill_0.cooltime int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/shinigami/settings/ with storage werewolf: role.shinigami