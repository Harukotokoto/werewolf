#ゲームモード変更
data modify storage werewolf: phase set value "stanby"

#時刻設定
time set 3000

##再帰処理をクリア
schedule clear werewolf:system/time_change/day
schedule clear werewolf:system/time_change/night
