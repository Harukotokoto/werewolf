## リセット
data modify storage werewolf: gamestate.quest.active set value false
## 個別処理
data modify entity @e[type=minecraft:item_display,tag=ice_sword,limit=1] Glowing set value false
#animated_java用
function animated_java:fake_wall/remove/all
execute as @e[type=marker,tag=fake_wall] at @s positioned ~0.5 ~ ~0.5 run function animated_java:fake_wall/summon
execute as @e[type=marker,tag=fake_wall] at @s run data modify entity @e[type=#animated_java:root,tag=aj.fake_wall.root,limit=1] Rotation[0] set from entity @s Rotation[0]
execute as @e[type=marker,tag=fake_wall] at @s run setblock ~ ~ ~ barrier
execute as @e[type=marker,tag=fake_wall] at @s run setblock ~ ~1 ~ barrier

