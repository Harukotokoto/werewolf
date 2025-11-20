# ボタン配置Slotにあるアイテムをplayer.cursorに返却
$item replace entity @s player.cursor from entity @s container.$(slot)
# 流出したボタンアイテムをclear
$clear @s *[minecraft:custom_data~{Tags:["inventory_seal"],Slot:$(slot)}]

# ボタンアイテムを再配置
$loot replace entity @s container.$(slot) loot werewolf:inventory_seal/buttons/slot_$(slot)

# 関数を実行
execute at @s run function werewolf:asset/sfx/error

# debug
#$tellraw @s "$(slot)"
