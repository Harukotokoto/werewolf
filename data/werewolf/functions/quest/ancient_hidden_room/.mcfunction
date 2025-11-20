## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

##クエスト処理
execute at @e[type=marker,tag=hidden_wall_opener] run particle minecraft:crit ~ ~ ~ 0.2 1 0.2 0 10 force @a
execute at @e[type=marker,tag=hidden_wall_opener] as @a[tag=player,distance=..0.7] run title @s actionbar "その場で待機する(残り1人)"
execute at @e[type=marker,tag=hidden_wall_opener_1] if entity @a[tag=player,distance=..0.7] at @e[type=marker,tag=hidden_wall_opener_2] if entity @a[tag=player,distance=..0.7] run function werewolf:quest/ancient_hidden_room/open with storage werewolf: settings


## イベント終了処理
#成功
execute if score #GameManager quest_timer matches 0.. at @e[type=marker,tag=hidden_wall_opener_1] if entity @a[tag=player,distance=..0.7] at @e[type=marker,tag=hidden_wall_opener_2] if entity @a[tag=player,distance=..0.7] run return run function werewolf:quest/ancient_hidden_room/clear
#失敗
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/ancient_hidden_room/failed


## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/ancient_hidden_room/ 1t