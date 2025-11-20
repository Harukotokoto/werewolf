## 成功判定
#初日ならreturn
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/ojousama/skill/.error
#使用回数超過ならreturn
execute as @s[scores={skill_limit_0=0}] run return run function werewolf:role/ojousama/skill/.error
#クエスト中でなければreturn
execute unless data storage werewolf: gamestate.quest{active:true} run return run function werewolf:role/ojousama/skill/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_0=1..}] run return run function werewolf:role/ojousama/skill/.error

## 実行
function werewolf:role/ojousama/skill/main_1

## クールタイムを更新
execute store result score @s skill_cooltime_0 run data get storage werewolf: role.ojousama.skill_0.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_0 1