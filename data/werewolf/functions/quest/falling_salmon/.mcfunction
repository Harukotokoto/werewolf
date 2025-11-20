## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

##クエスト処理
#鮭にパーティクル
execute as @e[type=minecraft:salmon,tag=quest_salmon,tag=quest] at @s if data entity @s {OnGround:0b} run particle minecraft:rain ~ ~ ~ 0.3 0.3 0.3 0 2 force @a


## イベント終了処理
#成功
execute if score #GameManager quest_timer matches 0.. unless entity @e[type=minecraft:salmon,tag=quest_salmon,tag=quest] run return run function werewolf:quest/falling_salmon/clear
#失敗
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/falling_salmon/clear


## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/falling_salmon/ 1t