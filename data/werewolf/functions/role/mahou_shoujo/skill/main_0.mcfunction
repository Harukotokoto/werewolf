## 成功判定
#初日
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/mahou_shoujo/skill/.error
#使用回数超過ならreturn
execute as @s[scores={skill_limit_2=0}] run return run function werewolf:role/mahou_shoujo/skill/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_2=1..}] run return run function werewolf:role/mahou_shoujo/skill/.error

## 実行
execute as @s[team=mahou_shoujo] run function werewolf:role/mahou_shoujo/skill/main_1 with storage macro:
execute as @s[team=!mahou_shoujo] run function werewolf:role/mahou_shoujo/skill/main_1_dummy with storage macro:

## クールタイムを更新
execute store result score @s skill_cooltime_2 run data get storage werewolf: role.mahou_shoujo.skill_2.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_2 1