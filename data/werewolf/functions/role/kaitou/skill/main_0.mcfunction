## 視線上のプレイヤーを厳密に検知
function werewolf:.util/eye_detection/player/

## プレイヤー検知に失敗したならreturn
execute unless data storage macro: reserve_0 run return fail

## 成功判定
#参加人数を記録
execute store result score #GameManager reserve_0 run data get storage werewolf: player_list
#生存人数を記録
execute store result score #GameManager reserve_1 if entity @a[tag=player,scores={ID=0..}]
#半数以下か
scoreboard players operation #GameManager reserve_0 /= #GameManager reserve_1

#初日ならreturn
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run function werewolf:role/kaitou/skill/.error
#過半数以下ならreturn
execute unless score #GameManager reserve_0 matches 1 run return run function werewolf:role/kaitou/skill/.error
#使用回数超過ならreturn
execute as @s[scores={skill_limit_0=0}] run return run function werewolf:role/kaitou/skill/.error
#クールタイム中ならreturn
execute as @s[scores={skill_cooltime_0=1..}] run return run function werewolf:role/kaitou/skill/.error

## クールタイムを更新
execute store result score @s skill_cooltime_0 run data get storage werewolf: role.kaitou.skill_0.cooltime
## 使用回数を減算
scoreboard players remove @s skill_limit_0 1

## 実行
function werewolf:role/kaitou/skill/main_1 with storage macro:


##今tickスキル制限
scoreboard players set @s right_click 100