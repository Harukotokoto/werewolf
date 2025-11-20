##当たり判定
execute as @e[type=!player,tag=!executor,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run tag @s add this

##距離を加算
scoreboard players add @s reserve_0 1

##再帰処理
execute unless entity @e[tag=this] if score @s reserve_0 matches ..400 positioned ^ ^ ^0.01 rotated ~ ~ run function werewolf:.util/eye_detection/mobs/0