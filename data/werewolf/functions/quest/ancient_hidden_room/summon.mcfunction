## summon

kill @e[type=!marker,tag=ice_sword]
$execute at @e[type=marker,tag=ice_sword,tag=$(field)] run summon item_display ~ ~0.5 ~ {Glowing:true,item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":1000}},Tags:["quest","ice_sword"],Rotation:[137.828f,18.9f]}
$execute at @e[type=marker,tag=ice_sword,tag=$(field)] run summon interaction ~ ~ ~ {Tags:["quest","ice_sword"],height:1.5f,width:0.3f}