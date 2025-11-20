## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

##クエスト処理
#ファントムをその場に拘束
execute as @e[type=minecraft:marker,tag=sky,tag=quest] at @s if entity @e[type=minecraft:phantom,tag=target,tag=quest,distance=..4] run tp @e[type=minecraft:phantom,tag=target,tag=quest,sort=nearest,limit=1] ~ ~ ~
execute as @e[type=minecraft:phantom,tag=target,tag=quest] at @s unless entity @e[type=minecraft:marker,tag=sky,tag=quest,distance=..4] run tp @s @e[type=minecraft:marker,tag=sky,tag=quest,sort=nearest,limit=1]

## イベント終了処理
#成功
execute if score #GameManager quest_timer matches 0.. unless entity @e[type=minecraft:phantom,tag=target,tag=quest] run return run function werewolf:quest/hit_the_target/clear
#失敗
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/hit_the_target/failed


## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/hit_the_target/ 1t