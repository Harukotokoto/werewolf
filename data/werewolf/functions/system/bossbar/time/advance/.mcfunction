##全員の独自のbossbarを進行

##代入する値を用意
scoreboard players remove #GameManager common_timer 1

##再帰回数を記録
execute store result storage macro: reserve_0 int 1 run scoreboard players get #GameManager ID


##実行
function werewolf:system/bossbar/time/advance/0 with storage macro:
