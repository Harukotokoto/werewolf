## thunder_wand
# 発砲
function werewolf:item/wand/thunder_wand/2

# 演出
playsound minecraft:item.trident.return master @a ~ ~ ~ 1.0 1.3 0.0

# 残り回数を更新
function werewolf:item/wand/.common/count_update/
execute if items entity @s weapon.offhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] unless items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run function werewolf:item/wand/thunder_wand/offhand with storage macro:
execute if items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run function werewolf:item/wand/thunder_wand/mainhand with storage macro: