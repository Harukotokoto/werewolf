## tame

data modify entity @e[type=wolf,tag=quest_wolf,tag=no_tame,limit=1] Owner set from entity @s UUID
data modify entity @e[type=wolf,tag=quest_wolf,tag=no_tame,limit=1] Sitting set value true
tag @e[type=wolf,tag=quest_wolf,tag=no_tame,limit=1] remove no_tame

execute as @e[type=interaction,tag=quest_wolf] at @s run particle minecraft:heart ~ ~0.3 ~ 0.3 0.3 0.3 0 5 force @a

execute as @e[type=interaction,tag=quest_wolf] run kill @s


#狼をテイムした人の基礎速度を上げる

#現在の基礎速度を記録
execute store result score @s reserve_0 run attribute @s generic.movement_speed get 100
#+1
scoreboard players add @s reserve_0 1
#storageに記録
execute store result storage macro: reserve_0 int 1 run scoreboard players get @s reserve_0
#体力を反映
function werewolf:quest/stray_wolf/tame_1 with storage macro: