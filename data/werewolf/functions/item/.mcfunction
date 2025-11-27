##smoke_bomb
function werewolf:item/smoke_bomb/

##tnt_bomb
function werewolf:item/tnt_bomb/

##same_look_tool
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["same_look_tool"]}] run function werewolf:item/same_look_tool/run

##blind_tool
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["blindness_tool"]}] run function werewolf:item/blindness_tool/run

##glowing_tool
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["glowing_tool"]}] run function werewolf:item/glowing_tool/run

##cleanse_tool
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["cleanse_tool"]}] run function werewolf:item/cleanse_tool/run

##job_change_villager
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["job_change_villager"]}] run function werewolf:item/job_change_villager/run

##sword
function werewolf:item/sword/

##wand
function werewolf:item/wand/

##hat
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["hat"]}] at @s run function werewolf:.util/item_processing/wear_a_hat/

##その他
#空き瓶を削除
clear @a glass_bottle
#弓の軌道を表示
execute at @e[type=arrow] run particle minecraft:end_rod ~ ~ ~ 0.001 0.001 0.001 0 1 force @a
#撃った弓矢を拾えないように
execute as @e[type=arrow] if entity @s run data modify entity @s life set value 1200
#武器系を手に持った時に攻撃力を限りなく下げる
execute as @a if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["weapon"]}] run attribute @s minecraft:generic.attack_damage base set 0.00001
execute as @a unless items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["weapon"]}] run attribute @s minecraft:generic.attack_damage base set 1.0