## summon

#納品箱設置
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run summon item_display ~0.5 ~-1000 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":1012}},Tags:["delivery_box","delivery_emerald","quest"],Glowing:true}
$execute as @e[type=item_display,tag=delivery_emerald] run data modify entity @s Rotation set from entity @e[type=marker,tag=delivery_box,tag=$(field),sort=nearest,limit=1] Rotation
$execute as @e[type=marker,tag=delivery_box,tag=$(field)] at @s align xyz run tp @e[type=item_display,tag=delivery_emerald,sort=nearest,limit=1] ~0.5 ~0.51 ~0.5
team join glowing_red @e[type=item_display,tag=delivery_box,tag=quest]
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run setblock ~ ~ ~ barrier
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run summon interaction ~0.5 ~1.01 ~0.5 {Tags:["delivery_box","delivery_emerald","quest"],width:1.01f,height:-1.01f}

#納品箱アナウンス
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run summon text_display ~0.5 ~1.3 ~0.5 {text:'{"text":"納品BOX","font":"custom_name"}',Tags:["delivery_box","delivery_emerald","quest"],Rotation:[-90f,0f],billboard:"vertical"}
#演出
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a 