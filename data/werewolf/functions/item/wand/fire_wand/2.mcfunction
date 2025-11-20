## 発動
#アイテム用意
execute anchored eyes run summon item ^ ^-0.1 ^0.5 {Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:fire_resistant":{},"minecraft:custom_model_data":99999}},Health:1s,PickupDelay:10000,Tags:["magic_bullet","fire","not_yet"],NoGravity:true,Age:5950}

#弾が埋まっていればダメージ処理後return
execute anchored eyes positioned ^ ^-0.1 ^0.5 unless block ~ ~ ~ #werewolf:no_collision run return run function werewolf:item/wand/fire_wand/damage

#投擲者を記録
data modify entity @e[type=item,tag=magic_bullet,tag=not_yet,sort=nearest,limit=1] Thrower set from entity @s UUID
#位置反映のためのダメージ
damage @e[type=item,limit=1,sort=nearest,tag=magic_bullet,tag=not_yet] 0.0

#ベクトル計算(max:1.6)
summon area_effect_cloud ^ ^ ^1.2 {Tags:["magic_bullet_motion"]}
#x(reserve_1)
execute store result score #GameManager reserve_1 run data get entity @e[type=area_effect_cloud,tag=magic_bullet_motion,limit=1] Pos[0] 100
execute store result score #GameManager reserve_2 run data get entity @s Pos[0] 100
scoreboard players operation #GameManager reserve_1 -= #GameManager reserve_2
#y(reserve_2)
execute store result score #GameManager reserve_2 run data get entity @e[type=area_effect_cloud,tag=magic_bullet_motion,limit=1] Pos[1] 100
execute store result score #GameManager reserve_3 run data get entity @s Pos[1] 100
scoreboard players operation #GameManager reserve_2 -= #GameManager reserve_3
#z(reserve_3)
execute store result score #GameManager reserve_3 run data get entity @e[type=area_effect_cloud,tag=magic_bullet_motion,limit=1] Pos[2] 100
execute store result score #GameManager reserve_4 run data get entity @s Pos[2] 100
scoreboard players operation #GameManager reserve_3 -= #GameManager reserve_4
#Motion代入
execute store result entity @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] Motion[0] double 0.01 run scoreboard players get #GameManager reserve_1
execute store result entity @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] Motion[1] double 0.01 run scoreboard players get #GameManager reserve_2
execute store result entity @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] Motion[2] double 0.01 run scoreboard players get #GameManager reserve_3

#おかたづけ
kill @e[type=area_effect_cloud,tag=magic_bullet_motion,limit=1]

#壁や床に当たった時に消滅するための例外処理
execute as @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] store result storage item: motion double 0.001 run data get entity @s Motion[0] 1000
execute as @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] unless data storage item: {motion:0d} run tag @s add motion_x

execute as @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] store result storage item: motion double 0.001 run data get entity @s Motion[1] 1000
execute as @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] unless data storage item: {motion:0d} run tag @s add motion_y

execute as @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] store result storage item: motion double 0.001 run data get entity @s Motion[2] 1000
execute as @e[type=item,tag=magic_bullet,tag=not_yet,limit=1,sort=nearest] unless data storage item: {motion:0d} run tag @s add motion_z

#処理終了
tag @e[type=item,tag=magic_bullet,tag=not_yet,sort=nearest,limit=1] remove not_yet