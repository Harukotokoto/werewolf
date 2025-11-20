## ショット(通常)


## 物理演算
execute as @e[type=item,tag=roar] run function werewolf:role/jinrou/skill/roar/main_4

## 演出
execute at @e[type=item,tag=roar] run particle sonic_boom

## ダメージ処理
execute at @e[type=item,tag=roar] as @e[tag=!roar,tag=!no_collision,type=!#werewolf:no_shield,distance=..2,team=!_heaven,team=!_spectator] unless score @s charge_roar matches 0.. run tag @s add hit_roar
execute as @e[tag=hit_roar] at @s run function werewolf:role/jinrou/skill/roar/damage