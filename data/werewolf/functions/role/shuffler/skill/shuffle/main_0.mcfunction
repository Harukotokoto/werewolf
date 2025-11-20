## 成功判定
#使用回数超過ならreturn
execute as @s[scores={skill_limit_2=0}] run return run function werewolf:role/shuffler/skill/shuffle/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_2=1..}] run return run function werewolf:role/shuffler/skill/shuffle/.error

## 実行
function werewolf:role/shuffler/skill/shuffle/main_1 with storage macro:

## クールタイムを更新
execute store result score @s skill_cooltime_2 run data get storage werewolf: role.shuffler.skill_2.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_2 1