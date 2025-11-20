## 墓の基盤を用意
summon minecraft:interaction ~ ~ ~ {width:0.6f,height:0.6f,Tags:["grave","not_yet"]}
summon minecraft:item_display ~ ~0.5 ~ {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":1}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],translation:[0,0,0],scale:[0.67f,0.67f,0.67f]},Tags:["grave","grave_stone","not_yet"]}
summon minecraft:item_display ~ ~ ~ {transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],translation:[0,0,0],scale:[0.33f,0.33f,0.33f]},Tags:["grave","grave_head","not_yet"]}

## スキンを代入
$execute as @a[scores={ID=$(reserve_0)}] run loot replace entity @e[tag=grave,tag=grave_head,tag=not_yet,sort=nearest,limit=1] container.0 loot werewolf:get_name

## 位置調整
tp @e[tag=grave,tag=grave_stone,tag=not_yet,limit=1] ~ ~0.329 ~ ~ 0
tp @e[tag=grave,tag=grave_head,tag=not_yet,limit=1] ~ ~0.245 ~ ~-180 0

## 死者判別用のタグ付与
$scoreboard players set @e[type=interaction,tag=grave,tag=not_yet,sort=nearest,limit=1] ID $(reserve_0)
$scoreboard players set @e[type=item_display,tag=grave,tag=not_yet,sort=nearest,limit=2] ID $(reserve_0)

## 識別タグを削除
tag @e[type=item_display,tag=grave_stone,tag=not_yet,sort=nearest,limit=1] remove not_yet
tag @e[type=item_display,tag=grave_head,tag=not_yet,sort=nearest,limit=1] remove not_yet
tag @e[type=interaction,tag=grave,tag=not_yet,sort=nearest,limit=1] remove not_yet

# 自らを削除
kill @s

