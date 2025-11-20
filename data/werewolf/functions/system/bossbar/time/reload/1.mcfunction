##全員の独自のbossbarを更新


##最大数値をmaxに代入
$execute store result bossbar personal_$(reserve_0) max run scoreboard players get #GameManager common_timer

##再帰回数を減算
execute store result storage macro: reserve_0 int 0.99999 run data get storage macro: reserve_0


##中断処理
execute if data storage macro: {reserve_0:0} run return fail
##再帰処理
function werewolf:system/bossbar/time/reload/1 with storage macro:
