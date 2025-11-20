## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

##クエスト処理
#視線先アナウンス
execute as @a[predicate=werewolf:look_at/quest/object] run title @s actionbar {"text":"手懐ける (右クリック)"}
#interactionをtp
execute as @e[type=wolf,tag=quest_wolf,tag=no_tame] at @s run tp @e[type=interaction,tag=quest_wolf] @s
#interactionの on target に実行
execute as @e[type=interaction,tag=quest_wolf] if data entity @s interaction.player on target run function werewolf:quest/stray_wolf/tame

## イベント終了処理
execute if score #GameManager quest_timer matches 0.. unless entity @e[type=wolf,tag=quest_wolf,tag=no_tame,tag=quest] run return run function werewolf:quest/stray_wolf/clear
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/stray_wolf/failed

## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/stray_wolf/ 1t