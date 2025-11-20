# オフハンドにボタンアイテムを所持していた場合の処理
execute if items entity @s weapon.offhand *[minecraft:custom_data~{Tags:["inventory_seal"]}] run function werewolf:.util/inventory_seal/2

# 流出したボタンアイテムをclear
clear @s *[minecraft:custom_data~{Tags:["inventory_seal"]}]
# ボタンアイテムを再配置

loot replace entity @s container.9 loot werewolf:inventory_seal/buttons/slot_9
loot replace entity @s container.10 loot werewolf:inventory_seal/buttons/slot_10
loot replace entity @s container.11 loot werewolf:inventory_seal/buttons/slot_11
loot replace entity @s container.12 loot werewolf:inventory_seal/buttons/slot_12
loot replace entity @s container.13 loot werewolf:inventory_seal/buttons/slot_13
loot replace entity @s container.14 loot werewolf:inventory_seal/buttons/slot_14
loot replace entity @s container.15 loot werewolf:inventory_seal/buttons/slot_15
loot replace entity @s container.16 loot werewolf:inventory_seal/buttons/slot_16
loot replace entity @s container.17 loot werewolf:inventory_seal/buttons/slot_17
loot replace entity @s container.18 loot werewolf:inventory_seal/buttons/slot_18
loot replace entity @s container.19 loot werewolf:inventory_seal/buttons/slot_19
loot replace entity @s container.20 loot werewolf:inventory_seal/buttons/slot_20
loot replace entity @s container.21 loot werewolf:inventory_seal/buttons/slot_21
loot replace entity @s container.22 loot werewolf:inventory_seal/buttons/slot_22
loot replace entity @s container.23 loot werewolf:inventory_seal/buttons/slot_23
loot replace entity @s container.24 loot werewolf:inventory_seal/buttons/slot_24
loot replace entity @s container.25 loot werewolf:inventory_seal/buttons/slot_25
loot replace entity @s container.26 loot werewolf:inventory_seal/buttons/slot_26
loot replace entity @s container.27 loot werewolf:inventory_seal/buttons/slot_27
loot replace entity @s container.28 loot werewolf:inventory_seal/buttons/slot_28
loot replace entity @s container.29 loot werewolf:inventory_seal/buttons/slot_29
loot replace entity @s container.30 loot werewolf:inventory_seal/buttons/slot_30
loot replace entity @s container.31 loot werewolf:inventory_seal/buttons/slot_31
loot replace entity @s container.32 loot werewolf:inventory_seal/buttons/slot_32
loot replace entity @s container.33 loot werewolf:inventory_seal/buttons/slot_33
loot replace entity @s container.34 loot werewolf:inventory_seal/buttons/slot_34
loot replace entity @s container.35 loot werewolf:inventory_seal/buttons/slot_35


