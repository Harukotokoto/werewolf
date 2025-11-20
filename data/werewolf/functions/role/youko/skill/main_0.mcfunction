## 視線上のプレイヤーを厳密に検知
function werewolf:.util/eye_detection/player/

## プレイヤー検知に失敗したならreturn
execute unless data storage macro: reserve_0 run return fail

## 成功判定
#使用回数超過ならreturn
execute as @s[scores={skill_limit_0=0}] run return run function werewolf:role/youko/skill/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_0=1..}] run return run function werewolf:role/youko/skill/.error
#初日以降ならreturn
execute unless data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/youko/skill/.error

## 実行
function werewolf:role/youko/skill/main_1 with storage macro:

## クールタイムを更新
execute store result score @s skill_cooltime_0 run data get storage werewolf: role.youko.skill_0.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_0 1