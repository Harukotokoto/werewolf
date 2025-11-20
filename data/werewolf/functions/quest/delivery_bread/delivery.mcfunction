#納品
execute as @s[nbt=!{Inventory:[{id:"minecraft:bread"}]}] run tellraw @s {"text":"納品するものを持っていない"}
execute as @s[nbt={Inventory:[{id:"minecraft:bread"}]}] store result storage werewolf: gamestate.quest.count int 0.99999999 run data get storage werewolf: gamestate.quest.count
execute as @s[nbt={Inventory:[{id:"minecraft:bread"}]}] run clear @s bread 1

#納品箱の見た目更新
execute if data storage werewolf: gamestate.quest{count:9} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1002}}}
execute if data storage werewolf: gamestate.quest{count:7} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1003}}}
execute if data storage werewolf: gamestate.quest{count:5} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1004}}}
execute if data storage werewolf: gamestate.quest{count:2} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1005}}}


advancement revoke @s only werewolf:interacted_with_entity/quest/delivery_bread