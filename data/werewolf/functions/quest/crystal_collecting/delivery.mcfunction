#納品
execute as @s[nbt=!{Inventory:[{components:{"minecraft:custom_data":{Tags:["quest","crystal"]}}}]}] run tellraw @s {"text":"納品するものを持っていない"}
execute as @s[nbt={Inventory:[{components:{"minecraft:custom_data":{Tags:["quest","crystal"]}}}]}] store result storage werewolf: gamestate.quest.count int 0.99999999 run data get storage werewolf: gamestate.quest.count
execute as @s[nbt={Inventory:[{components:{"minecraft:custom_data":{Tags:["quest","crystal"]}}}]}] run clear @s minecraft:emerald[minecraft:custom_data~{Tags:["quest","crystal"]}] 1

#納品箱の見た目更新
execute if data storage werewolf: gamestate.quest{count:9} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1014}}}
execute if data storage werewolf: gamestate.quest{count:7} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1015}}}
execute if data storage werewolf: gamestate.quest{count:5} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1016}}}
execute if data storage werewolf: gamestate.quest{count:2} at @e[type=marker,tag=delivery_box] run data merge entity @e[type=item_display,tag=delivery_box,sort=nearest,limit=1] {item:{components:{"minecraft:custom_model_data":1017}}}


advancement revoke @s only werewolf:interacted_with_entity/quest/crystal_collecting