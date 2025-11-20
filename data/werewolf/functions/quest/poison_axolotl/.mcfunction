## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

##クエスト処理
#視線先アナウンス
execute as @a[predicate=werewolf:look_at/quest/object] run title @s actionbar {"text":"住処に帰す (右クリック)"}
#bossを光らせる
execute at @e[type=axolotl,tag=quest_axolotl,tag=boss,tag=quest] run particle minecraft:crit ~ ~ ~ 0.5 0.5 0.5 0 1 force @a
#interactionをtp
execute as @e[type=axolotl,tag=quest_axolotl,tag=boss,tag=quest] at @s run tp @e[type=interaction,tag=quest_axolotl,tag=boss,tag=quest] @s
#interactionの on target に実行
execute as @e[type=interaction,tag=quest_axolotl,tag=boss,tag=quest] if data entity @s interaction.player on target run function werewolf:quest/poison_axolotl/interaction
#axolotl周りに毒を散布
execute at @e[type=axolotl,tag=quest_axolotl,tag=normal,tag=quest] run particle minecraft:effect ~ ~-0.5 ~ 3 0 3 0 2 force @a
execute at @e[type=axolotl,tag=quest_axolotl,tag=normal,tag=quest] as @a[distance=..3,predicate=!werewolf:is_effect/poison] run effect give @s poison 1 3 true


## イベント終了処理
execute if score #GameManager quest_timer matches 0.. unless entity @e[type=interaction,tag=quest_axolotl,tag=boss,tag=quest] run return run function werewolf:quest/poison_axolotl/clear
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/poison_axolotl/failed

## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/poison_axolotl/ 1t