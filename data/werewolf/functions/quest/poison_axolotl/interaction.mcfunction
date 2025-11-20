## tame

execute as @e[type=interaction,tag=quest_axolotl,tag=boss,tag=quest] at @s run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

execute as @e[type=interaction,tag=quest_axolotl,tag=boss,tag=quest] run kill @s

## 最大体力増加
#現在の最大体力を記録
execute store result score @s reserve_0 run attribute @s generic.max_health get
#+6
scoreboard players add @s reserve_0 6
#storageに記録
execute store result storage macro: reserve_0 int 1 run scoreboard players get @s reserve_0
#体力を反映
function werewolf:quest/poison_axolotl/interaction_1 with storage macro: