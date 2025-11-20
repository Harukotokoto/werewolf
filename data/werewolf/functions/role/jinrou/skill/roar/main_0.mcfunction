## 成功判定
#夜以外ならreturn
execute unless data storage werewolf: gamestate.time{id:"night"} run return run function werewolf:role/jinrou/skill/roar/.error
#使用回数超過ならreturn
execute as @s[scores={skill_limit_2=0}] run return run function werewolf:role/jinrou/skill/roar/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_2=1..}] run return run function werewolf:role/jinrou/skill/roar/.error

## スキル発動のためのスコアボード開放
scoreboard players add @s charge_roar 0

## クールタイムを更新
execute store result score @s skill_cooltime_2 run data get storage werewolf: role.jinrou.skill_2.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_2 1