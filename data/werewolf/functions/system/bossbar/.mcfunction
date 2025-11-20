# 昼夜サイクル
execute if score #GameManager common_timer matches 1.. run scoreboard players remove #GameManager common_timer 1
execute if score #GameManager common_timer matches 1.. run execute store result bossbar personal_bossbar value run scoreboard players get #GameManager common_timer
#昼から夜に
#緊急会議を無効化
execute if score #GameManager common_timer matches 0 if data storage sys: {personal_phase:day} run scoreboard players set #GameManager can_convence 1
execute if score #GameManager common_timer matches 0 if data storage sys: {personal_phase:day} run function werewolf:.system/personal_change/change_night
#夜から昼に
execute if score #GameManager common_timer matches 1 if data storage sys: {personal_phase:night} run function werewolf:.system/personal_change/change_day
#緊急会議を有効化
execute unless score #GameManager common_timer matches ..0 if data storage sys: {personal_phase:day} if score #GameManager can_convence matches 1 run scoreboard players set #GameManager can_convence 0