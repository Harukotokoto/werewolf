## 視線上のプレイヤーを厳密に検知
function werewolf:.util/eye_detection/player/

## プレイヤー検知に失敗したならreturn
execute unless data storage macro: reserve_0 run return fail

## 成功判定
#初日ならreturn
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/jinrou/skill/slash/.error
#使用回数超過ならreturn
execute as @s[scores={skill_limit_0=0}] run return run function werewolf:role/jinrou/skill/slash/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_0=1..}] run return run function werewolf:role/jinrou/skill/slash/.error

## 実行
function werewolf:role/jinrou/skill/slash/main_1 with storage macro:

## クールタイムを更新
execute store result score @s skill_cooltime_0 run data get storage werewolf: role.jinrou.skill_0.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_0 1