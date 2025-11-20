## fire_wand
# 発砲
function werewolf:item/wand/fire_wand/2

# 演出
playsound minecraft:item.firecharge.use master @a ~ ~ ~ 0.5 1 0.0

# 残り回数を更新
function werewolf:item/wand/.common/count_update/
execute if items entity @s weapon.offhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] unless items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run function werewolf:item/wand/fire_wand/offhand with storage macro:
execute if items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run function werewolf:item/wand/fire_wand/mainhand with storage macro: