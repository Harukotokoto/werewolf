##tick

## 共通
execute as @a[scores={fall_into_a_pitfall=1..}] run function werewolf:role/wanashi/skill/main_4

## 通常
#罠を可視化する処理
execute at @e[type=snowball,tag=pitfall,tag=!inactive] run function werewolf:role/wanashi/skill/particle
#罠師が離れると罠起動
execute as @e[type=snowball,tag=pitfall,tag=inactive] at @s unless entity @a[team=wanashi,distance=..1.3] run tag @s remove inactive
#罠にかかった時の処理
execute at @e[type=snowball,tag=pitfall,tag=!inactive] as @a[distance=..1.2,tag=player] at @s run function werewolf:role/wanashi/skill/main_3


## ダミー
#罠を可視化する処理
execute as @e[type=snowball,tag=pitfall_dummy,tag=!inactive] at @s on origin run function werewolf:role/wanashi/skill/particle_dummy
#ポンコツ罠師が離れると罠起動
execute as @e[type=snowball,tag=pitfall_dummy,tag=inactive] at @s unless entity @a[team=!wanashi,tag=team_wanashi,distance=..1.3] run tag @s remove inactive
#罠にかかった時の処理
execute as @e[type=snowball,tag=pitfall_dummy,tag=!inactive] at @s on origin as @s[distance=..1.2,tag=player] at @s run function werewolf:role/wanashi/skill/main_3_dummy