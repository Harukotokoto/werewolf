## ショット(ダミー)


## 物理演算
execute as @e[type=item,tag=cupid_arrow_dummy] run function werewolf:role/cupid/skill/main_4_dummy

## 演出
execute if entity @e[type=item,tag=cupid_arrow_dummy] as @e[type=item,tag=cupid_arrow_dummy] at @s on origin run particle heart ~ ~ ~ 0.2 0.2 0.2 0 3 force @s
execute if entity @e[type=item,tag=cupid_arrow_dummy] at @e[type=item,tag=cupid_arrow_dummy] run particle heart ~ ~ ~ 0.2 0.2 0.2 0 3 force @a[tag=!player]

## ダメージ処理
execute if entity @e[type=item,tag=cupid_arrow_dummy] at @e[type=item,tag=cupid_arrow_dummy] as @e[tag=!cupid_arrow_dummy,tag=!no_collision,type=!#werewolf:no_shield,distance=..2,tag=player] unless score @s charge_cupid_arrow matches 0.. run tag @s add hit_cupid_arrow_dummy
execute as @e[tag=hit_cupid_arrow_dummy] at @s run function werewolf:role/cupid/skill/hit_dummy