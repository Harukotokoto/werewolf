## summon

#納品箱設置
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run summon item_display ~0.5 ~-1000 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":1006}},Tags:["delivery_box","delivery_apple","quest"],Glowing:true}
$execute as @e[type=item_display,tag=delivery_apple] run data modify entity @s Rotation set from entity @e[type=marker,tag=delivery_box,tag=$(field),sort=nearest,limit=1] Rotation
$execute as @e[type=marker,tag=delivery_box,tag=$(field)] at @s align xyz run tp @e[type=item_display,tag=delivery_apple,sort=nearest,limit=1] ~0.5 ~0.51 ~0.5
team join glowing_red @e[type=item_display,tag=delivery_box,tag=quest]
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run setblock ~ ~ ~ barrier
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run summon interaction ~0.5 ~1.01 ~0.5 {Tags:["delivery_box","delivery_apple","quest"],width:1.01f,height:-1.01f}
#納品箱アナウンス
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run summon text_display ~0.5 ~1.3 ~0.5 {text:'{"text":"納品BOX","font":"custom_name"}',Tags:["delivery_box","delivery_apple","quest"],Rotation:[-90f,0f],billboard:"vertical"}
#演出
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

#リンゴ設置
$execute as @e[type=marker,tag=fruit,tag=$(field),sort=random,limit=15] run tag @s add bear
execute at @e[type=marker,tag=fruit,tag=bear] run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
execute at @e[type=marker,tag=fruit,tag=bear] run summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":1011}},Tags:["delivery_apple","fruit"],Glowing:true}
execute at @e[type=marker,tag=fruit,tag=bear] run summon interaction ~ ~ ~ {Tags:["fruit","apple"],width:0.5f,height:0.5f}
execute as @e[type=marker,tag=fruit] run tag @s remove bear