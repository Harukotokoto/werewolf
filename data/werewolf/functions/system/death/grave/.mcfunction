#墓の準備
summon minecraft:item ~ ~1 ~ {Item:{components:{"minecraft:fire_resistant":{},"minecraft:custom_model_data":99999},id:carrot_on_a_stick},Health:1s,PickupDelay:10000s,Tags:["grave","this","not_yet"]}
scoreboard players operation @e[type=item,sort=nearest,limit=1,tag=grave,tag=this] ID = @s ID
execute as @e[type=item,sort=nearest,limit=1,tag=grave,tag=this] on origin run data modify entity @e[type=item,sort=nearest,limit=1,tag=grave,tag=this] Thrower set from entity @s UUID

#プレイヤーの向きを代入
execute as @s at @s run data modify entity @e[type=item,sort=nearest,limit=1,tag=grave,tag=this,tag=not_yet] Rotation set from entity @s Rotation


tag @e[type=item,sort=nearest,limit=1,tag=grave,tag=this] remove this