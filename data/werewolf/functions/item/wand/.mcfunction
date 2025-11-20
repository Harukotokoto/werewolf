## プレイヤー処理
#クールタイム中のmainhand右クリックを無かったことに
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[!minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run scoreboard players remove @s right_click 1
#クールタイム減少
execute as @a if items entity @s weapon.mainhand *[!minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run item modify entity @s weapon.mainhand werewolf:set_damage/wand_durability_add
execute as @a if items entity @s weapon.offhand *[!minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run item modify entity @s weapon.offhand werewolf:set_damage/wand_durability_add

##個別処理
function werewolf:item/wand/fire_wand/.tick
function werewolf:item/wand/ice_wand/.tick
function werewolf:item/wand/thunder_wand/.tick
function werewolf:item/wand/heal_wand/.tick