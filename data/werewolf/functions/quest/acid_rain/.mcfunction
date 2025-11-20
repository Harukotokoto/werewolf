## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

##クエスト処理
#天候を雨に
execute if score #GameManager quest_timer matches 750 run weather rain
#頭上にブロックがなければウィザー状態を付与
execute if score #GameManager quest_timer matches 0..750 run execute as @a[tag=player] at @s positioned over motion_blocking if entity @s[dy=999] run effect give @s minecraft:wither 1 1 true
#天候をクリア
execute if score #GameManager quest_timer matches 90 run weather clear

## イベント終了処理
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/acid_rain/0

## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/acid_rain/ 1t