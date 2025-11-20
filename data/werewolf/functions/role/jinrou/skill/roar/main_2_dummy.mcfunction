## ショット(ダミー)


## 物理演算
execute as @e[type=item,tag=roar_dummy] run function werewolf:role/jinrou/skill/roar/main_4_dummy

## 演出
execute if entity @e[type=item,tag=roar_dummy] as @e[type=item,tag=roar_dummy] at @s on origin run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force @s
execute if entity @e[type=item,tag=roar_dummy] at @e[type=item,tag=roar_dummy] run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force @a[tag=!player]

## ダメージ処理
execute if entity @e[type=item,tag=roar_dummy] at @e[type=item,tag=roar_dummy] as @e[tag=!roar_dummy,tag=!no_collision,type=!#werewolf:no_shield,distance=..2,team=!_heaven,team=!_spectator] unless score @s charge_roar matches 0.. as @e[type=item,tag=roar_dummy] on origin run particle minecraft:explosion ~ ~1 ~ 1 1 1 0 3 force @s
execute if entity @e[type=item,tag=roar_dummy] at @e[type=item,tag=roar_dummy] as @e[tag=!roar_dummy,tag=!no_collision,type=!#werewolf:no_shield,distance=..2,team=!_heaven,team=!_spectator] unless score @s charge_roar matches 0.. run kill @e[type=item,tag=roar_dummy,sort=nearest,limit=1]