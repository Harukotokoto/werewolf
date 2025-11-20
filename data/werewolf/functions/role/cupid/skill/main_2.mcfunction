## ショット(通常)


## 物理演算
execute as @e[type=item,tag=cupid_arrow] run function werewolf:role/cupid/skill/main_4

## 演出
#パーティクルの表示
execute at @a[team=cupid] if entity @e[type=item,tag=cupid_arrow,distance=1.5..] at @e[type=item,tag=cupid_arrow] run particle heart ~ ~ ~ 0.2 0.2 0.2 0 3 force @a[team=cupid]
execute at @a[team=cupid] if entity @e[type=item,tag=cupid_arrow,distance=1.5..] at @e[type=item,tag=cupid_arrow] run particle heart ~ ~ ~ 0.2 0.2 0.2 0 3 force @a[tag=!player]

## ダメージ処理
execute at @e[type=item,tag=cupid_arrow] as @e[tag=!cupid_arrow,tag=!no_collision,type=!#werewolf:no_shield,distance=..2,tag=player] unless score @s charge_cupid_arrow matches 0.. run tag @s add hit_cupid_arrow
execute as @e[tag=hit_cupid_arrow] at @s run function werewolf:role/cupid/skill/hit