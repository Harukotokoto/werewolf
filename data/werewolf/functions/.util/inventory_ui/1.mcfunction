# ボタン配置Slotにあるアイテムをplayer.cursorに返却
$item replace entity @s player.cursor from entity @s container.$(slot)
# 流出したボタンアイテムをclear
$clear @s *[minecraft:custom_data~{Tags:["inventory_ui"],Slot:$(slot)}]
# ボタンアイテムを再配置
$loot replace entity @s container.$(slot) loot werewolf:inventory_ui/buttons/slot_$(slot)

# 関数を実行
$function werewolf:.util/inventory_ui/func/$(slot) with storage macro: util.inventory_ui.func

# debug
#$tellraw @s "$(slot)"
