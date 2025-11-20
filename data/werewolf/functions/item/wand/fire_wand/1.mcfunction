## ショット

## 演出
particle minecraft:dust{color:[1.0,0.35,0.1],scale:1.8} ~ ~ ~ 0.1 0.1 0.1 0 2 force @a


## 物理演算
function werewolf:item/wand/fire_wand/3
## ダメージ処理
execute at @s positioned ~-0.3 ~ ~-0.3 as @e[tag=!magic_bullet,tag=!no_collision,type=!#werewolf:no_shield,dx=0,team=!_heaven,team=!_spectator] positioned ~-0.0 ~-0.0 ~-0.0 if entity @s[dx=0] positioned ~0.0 ~0.0 ~0.0 run tag @s add hit_magic_bullet
execute on origin if entity @s[tag=hit_magic_bullet] run tag @s remove hit_magic_bullet

execute as @e[tag=hit_magic_bullet] at @s run function werewolf:item/wand/fire_wand/damage