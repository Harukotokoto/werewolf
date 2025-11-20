## bossbar
#時間の更新
data modify storage werewolf: gamestate.time.id set value "night"
data modify storage werewolf: gamestate.time.text set value '{"text":"夜時間","color":"white"}'
#夜時間をscoreboardに代入
execute store result score #GameManager common_timer run data get storage werewolf: settings.time.night.tick
#bossbar更新
function werewolf:system/bossbar/time/reload/

## クエスト処理
# ランダムクエストを無効化

## タスク処理
# 夜タスクを設置
function werewolf:task/set_night

## 裁判を解放
data modify storage werewolf: gamestate.can_trial set value true