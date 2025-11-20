##limit_add
execute store result score #GameManager reserve_0 run data get storage werewolf: role.kishi.skill_0.limit
scoreboard players add #GameManager reserve_0 1

#6以上なら999に
execute if score #GameManager reserve_0 matches 6.. run scoreboard players set #GameManager reserve_0 999

execute store result storage werewolf: role.kishi.skill_0.limit int 1 run scoreboard players get #GameManager reserve_0


#設定画面を更新
function werewolf:role/kishi/settings/ with storage werewolf: role.kishi