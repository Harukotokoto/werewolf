## bossbar
# 時刻を変更
time set 3000
# 時刻/日数を記録
data modify storage werewolf: gamestate.time.id set value "first_day"
data modify storage werewolf: gamestate.time.text set value '{"text":"初日の昼時間","color":"white"}'
data modify storage werewolf: gamestate.day_count.number set value 1
# 初日時間をscoreboardに代入
execute store result score #GameManager common_timer run data get storage werewolf: settings.time.first_day.tick

# タスク設定
function werewolf:task/set_day