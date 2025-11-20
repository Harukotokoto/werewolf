##tick

## プレイヤー処理
#通常
execute as @a[team=cupid,tag=team_cupid,scores={charge_cupid_arrow=0..}] at @s run function werewolf:role/cupid/skill/main_1
#ダミー
execute as @a[team=!cupid,tag=team_cupid,scores={charge_cupid_arrow=0..}] at @s run function werewolf:role/cupid/skill/main_1_dummy

## 縁結び処理
#通常
execute if entity @e[type=item,tag=cupid_arrow] run function werewolf:role/cupid/skill/main_2
#ダミー
execute if entity @e[type=item,tag=cupid_arrow_dummy] run function werewolf:role/cupid/skill/main_2_dummy