##全員の独自のbossbarを更新

##日数のtextを作成(表示の更新はadvance)
execute store result storage macro: reserve_0 int 1 run data get storage werewolf: gamestate.day_count.number
function werewolf:system/bossbar/time/reload/0 with storage macro:

##再帰回数を記録
execute store result storage macro: reserve_0 int 1 run scoreboard players get #GameManager ID


##実行
function werewolf:system/bossbar/time/reload/1 with storage macro:
