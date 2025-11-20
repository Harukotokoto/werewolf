## 咆哮発砲(ダミー)

#アイテム用意
execute anchored eyes run summon item ^ ^0.25 ^ {Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:fire_resistant":{},"minecraft:custom_model_data":99999}},Health:1s,PickupDelay:10000,Tags:["roar_dummy","not_yet"],NoGravity:true,Age:5950}
#投擲者を記録
data modify entity @e[type=item,tag=roar_dummy,tag=not_yet,sort=nearest,limit=1] Thrower set from entity @s UUID
#位置反映のためのダメージ
damage @e[type=item,limit=1,sort=nearest,tag=roar_dummy,tag=not_yet] 0.0

#ベクトル計算
summon area_effect_cloud ^ ^ ^1.5 {Tags:["roar_motion"]}
#x(reserve_1)
execute store result score #GameManager reserve_1 run data get entity @e[type=area_effect_cloud,tag=roar_motion,limit=1] Pos[0] 100
execute store result score #GameManager reserve_2 run data get entity @s Pos[0] 100
scoreboard players operation #GameManager reserve_1 -= #GameManager reserve_2
#y(reserve_2)
execute store result score #GameManager reserve_2 run data get entity @e[type=area_effect_cloud,tag=roar_motion,limit=1] Pos[1] 100
execute store result score #GameManager reserve_3 run data get entity @s Pos[1] 100
scoreboard players operation #GameManager reserve_2 -= #GameManager reserve_3
#z(reserve_3)
execute store result score #GameManager reserve_3 run data get entity @e[type=area_effect_cloud,tag=roar_motion,limit=1] Pos[2] 100
execute store result score #GameManager reserve_4 run data get entity @s Pos[2] 100
scoreboard players operation #GameManager reserve_3 -= #GameManager reserve_4
#Motion代入
execute store result entity @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] Motion[0] double 0.01 run scoreboard players get #GameManager reserve_1
execute store result entity @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] Motion[1] double 0.01 run scoreboard players get #GameManager reserve_2
execute store result entity @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] Motion[2] double 0.01 run scoreboard players get #GameManager reserve_3

#おかたづけ
kill @e[type=area_effect_cloud,tag=roar_motion,limit=1]

#壁や床に当たった時に消滅するための例外処理
execute as @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] store result storage item: motion double 0.001 run data get entity @s Motion[0] 1000
execute as @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] unless data storage item: {motion:0d} run tag @s add motion_x

execute as @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] store result storage item: motion double 0.001 run data get entity @s Motion[1] 1000
execute as @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] unless data storage item: {motion:0d} run tag @s add motion_y

execute as @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] store result storage item: motion double 0.001 run data get entity @s Motion[2] 1000
execute as @e[type=item,tag=roar_dummy,tag=not_yet,limit=1,sort=nearest] unless data storage item: {motion:0d} run tag @s add motion_z

#処理終了
tag @e[type=item,tag=roar_dummy,tag=not_yet,sort=nearest,limit=1] remove not_yet

#演出等
playsound entity.warden.sonic_boom master @s ~ ~ ~ 1 1 0.5