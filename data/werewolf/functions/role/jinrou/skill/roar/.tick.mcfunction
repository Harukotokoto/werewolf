##tick

## プレイヤー処理
#通常
execute as @a[team=jinrou,tag=team_jinrou,scores={charge_roar=0..}] at @s run function werewolf:role/jinrou/skill/roar/main_1
#ダミー
execute as @a[team=!jinrou,tag=team_jinrou,scores={charge_roar=0..}] at @s run function werewolf:role/jinrou/skill/roar/main_1_dummy

## 咆哮処理
#通常
execute if entity @e[type=item,tag=roar] run function werewolf:role/jinrou/skill/roar/main_2
#ダミー
execute if entity @e[type=item,tag=roar_dummy] run function werewolf:role/jinrou/skill/roar/main_2_dummy