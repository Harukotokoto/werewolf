## アナウンス
execute if score #GameManager common_timer matches 0 run tellraw @a {"text":"[システム] もうすぐ夜が明ける…"}
## 裁判を封印
data modify storage werewolf: gamestate.can_trial set value false

## 時間進行を停止
scoreboard players set #GameManager common_timer -1

## 時刻を進行
time add 100
execute store result storage game_manager: time_change int 1 run time query daytime


## 昼に実行
execute if data storage game_manager: {time_change:6000} run function werewolf:system/time_change/day_1
## 再帰処理
execute unless data storage game_manager: {time_change:6000} run schedule function werewolf:system/time_change/day 1t