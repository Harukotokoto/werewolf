#死亡座標を保存
execute store result storage macro: reserve_0 float 0.001 run scoreboard players get @s death_x
execute store result storage macro: reserve_1 float 0.001 run scoreboard players get @s death_y
execute store result storage macro: reserve_2 float 0.001 run scoreboard players get @s death_z
execute store result storage macro: reserve_3 float 0.001 run scoreboard players get @s death_rorate_0
execute store result storage macro: reserve_4 float 0.001 run scoreboard players get @s death_rorate_1

#死亡時の効果音をリカバリ-1
stopsound @s player entity.player.death
playsound minecraft:death_player player @s ~ ~ ~ 1.0 1 1.0

#指定座標に死亡者をtp
function werewolf:system/death/tp_0 with storage macro:

#死亡時の効果音をリカバリ-2
playsound minecraft:death_player player @s ~ ~ ~ 1.0 1 1.0

## 死亡tp用のitem(aecは何故か駄目)
execute if data storage werewolf: settings.gamemode{death_place_fixed:true} run execute at @s run summon item ~ ~0.1 ~ {Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:fire_resistant":{},"minecraft:custom_model_data":99999}},Health:1s,PickupDelay:10000,Tags:["death_tp","not_yet"],NoGravity:true,Age:-32768}
execute if data storage werewolf: settings.gamemode{death_place_fixed:false} run execute at @s run summon item ~ ~0.1 ~ {Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:fire_resistant":{},"minecraft:custom_model_data":99999}},Health:1s,PickupDelay:10000,Tags:["death_tp","not_yet"],NoGravity:true,Age:5998}
data modify entity @e[type=item,tag=death_tp,tag=not_yet,sort=nearest,limit=1] Thrower set from entity @s UUID
data modify entity @e[type=item,tag=death_tp,tag=not_yet,sort=nearest,limit=1] Rotation set from entity @s Rotation
execute store result score @e[type=item,tag=death_tp,tag=not_yet,sort=nearest,limit=1] ID run scoreboard players get @s ID
tag @e[type=item,tag=death_tp,tag=not_yet] remove not_yet

#処理を実行
function werewolf:system/death/main