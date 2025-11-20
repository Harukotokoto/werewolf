## bossbar
#時間の更新
data modify storage werewolf: gamestate.time.id set value "day"
data modify storage werewolf: gamestate.time.text set value '{"text":"昼時間","color":"white"}'
#日数を加算
execute store result storage werewolf: gamestate.day_count.number int -1 run data get storage werewolf: gamestate.day_count.number -1.01
#昼時間をscoreboardに代入
execute store result score #GameManager common_timer run data get storage werewolf: settings.time.day.tick
#bossbar更新
function werewolf:system/bossbar/time/reload/

## クエスト処理
# ランダムイベントを有効化
scoreboard players set #GameManager quest_timer 1000
# クエストの個別処理
#ペナルティmobをキル
execute as @e[tag=penalty,tag=quest] at @s run particle minecraft:cloud ~ ~0.5 ~ 1 1 1 0 5 force @a
tp @e[tag=penalty,tag=quest] ~ ~-1000 ~
kill @e[tag=penalty,tag=quest]

## タスク処理
# 再設置
function werewolf:task/set_day

## フィールドギミック処理
# ランダムチェスト再設置

## 役職共通処理
# スキル回復
execute as @a[scores={skill_cooltime_0=1..}] unless score @s skill_limit_0 matches ..0 run scoreboard players remove @s skill_cooltime_0 1
execute as @a[scores={skill_cooltime_1=1..}] unless score @s skill_limit_1 matches ..0 run scoreboard players remove @s skill_cooltime_1 1
## 役職個別処理
# パン屋処理
execute if entity @a[team=panya] run function werewolf:role/panya/skill/give_bread
# 裁判官による招集
function werewolf:role/saibankan/skill/regular_convening

## 裁判を解放
data modify storage werewolf: gamestate.can_trial set value true