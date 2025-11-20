## 罠の現在設置数を記録
execute at @s run summon marker ~ ~ ~ {Tags:[pitfall_counter]}
#通常
execute as @s[team=wanashi] run scoreboard players set #GameManager reserve_0 0
execute as @s[team=wanashi] run execute as @e[type=snowball,tag=pitfall] on origin at @s as @e[type=marker,tag=pitfall_counter,distance=..0.01] run scoreboard players add #GameManager reserve_0 1
#ダミー
execute as @s[team=!wanashi] run scoreboard players set #GameManager reserve_1 0
execute as @s[team=!wanashi] run execute as @e[type=snowball,tag=pitfall_dummy] on origin at @s as @e[type=marker,tag=pitfall_counter,distance=..0.01] run scoreboard players add #GameManager reserve_1 1

kill @e[type=marker,tag=pitfall_counter]


## 最大設置可能数を記録
execute store result score #GameManager reserve_2 run data get storage werewolf: role.wanashi.skill_2.count

## 成功判定
#初日ならreturn
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/wanashi/skill/.error
#使用回数超過ならreturn
execute as @s[scores={skill_limit_2=0}] run return run function werewolf:role/wanashi/skill/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_2=1..}] run return run function werewolf:role/wanashi/skill/.error
#罠設置数が上限ならreturn
execute as @s[team=wanashi] if score #GameManager reserve_0 >= #GameManager reserve_2 run return run function werewolf:role/wanashi/skill/.error
execute as @s[team=!wanashi] if score #GameManager reserve_1 >= #GameManager reserve_2 run return run function werewolf:role/wanashi/skill/.error
#空中ならreturn
execute if data entity @s {OnGround:0b} run return run function werewolf:role/wanashi/skill/.error
#罠にかかっている途中ならreturn
execute as @s[scores={fall_into_a_pitfall=1..}] run return run function werewolf:role/wanashi/skill/.error



## 実行
function werewolf:role/wanashi/skill/main_1


## クールタイムを更新
execute store result score @s skill_cooltime_2 run data get storage werewolf: role.wanashi.skill_2.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_2 1