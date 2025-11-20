## 成功判定
#初日ならreturn
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/kishi/skill/.error with storage macro:
#使用回数超過ならreturn
execute as @s[scores={skill_limit_0=0}] run return run function werewolf:role/kishi/skill/.error with storage macro:
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_0=1..}] run return run function werewolf:role/kishi/skill/.error with storage macro:
#誰かを守護中ならreturn
execute as @s[team=kishi] unless entity @s[scores={protected_new=0}] run return run function werewolf:role/kishi/skill/.error with storage macro:
execute as @s[team=!kishi] unless entity @s[scores={protected_dummy_new=0}] run return run function werewolf:role/kishi/skill/.error with storage macro:
#2連続守護ならreturn
$execute as @s[team=kishi] if entity @s[scores={protected_old=$(reserve_0)}] run return run function werewolf:role/kishi/skill/.error with storage macro:
$execute as @s[team=!kishi] if entity @s[scores={protected_dummy_old=$(reserve_0)}] run return run function werewolf:role/kishi/skill/.error with storage macro:

## 実行
function werewolf:role/kishi/skill/main_2 with storage macro:

## クールタイムを更新
execute store result score @s skill_cooltime_0 run data get storage werewolf: role.kishi.skill_0.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_0 1