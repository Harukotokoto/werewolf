## heal_wand
# 発砲
function werewolf:item/wand/heal_wand/2

# 演出
playsound minecraft:entity.ender_eye.death master @a ~ ~ ~ 1.0 1.9 0.0

# 残り回数を更新
function werewolf:item/wand/.common/count_update/
execute if items entity @s weapon.offhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] unless items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run function werewolf:item/wand/heal_wand/offhand with storage macro:
execute if items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] run function werewolf:item/wand/heal_wand/mainhand with storage macro: