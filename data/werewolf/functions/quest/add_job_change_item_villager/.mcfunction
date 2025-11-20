## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

## イベント終了処理
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/add_job_change_item_villager/0

## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/add_job_change_item_villager/ 1t