##時間を進行
execute if score #GameManager common_timer matches 1.. run function werewolf:system/bossbar/time/advance/

##昼夜を変更
execute if score #GameManager common_timer matches 0 run function werewolf:system/time_change/