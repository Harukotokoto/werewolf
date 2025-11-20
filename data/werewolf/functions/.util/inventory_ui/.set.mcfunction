# オフハンドにボタンアイテムを所持していた場合の処理
execute if items entity @s weapon.offhand *[minecraft:custom_data~{Tags:["inventory_ui"]}] run function werewolf:.util/inventory_ui/2

# 流出したボタンアイテムをclear
clear @s *[minecraft:custom_data~{Tags:["inventory_ui"]}]
# ボタンアイテムを再配置
function werewolf:system/inventory_ui/slot_9/set
function werewolf:system/inventory_ui/slot_10/set
function werewolf:system/inventory_ui/slot_11/set