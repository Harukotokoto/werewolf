#loversの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=lovers,tag=player]

## 成功判定
#初日
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/cupid/skill/.error
#使用回数超過ならreturn
execute as @s[scores={skill_limit_2=0}] run return run function werewolf:role/cupid/skill/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_2=1..}] run return run function werewolf:role/cupid/skill/.error
#恋人完成ならreturn
execute if score #GameManager reserve_0 matches 2.. run return run function werewolf:role/cupid/skill/.error

## スキル発動のためのスコアボード開放
scoreboard players add @s charge_cupid_arrow 0

## クールタイムを更新
execute store result score @s skill_cooltime_2 run data get storage werewolf: role.cupid.skill_2.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_2 1