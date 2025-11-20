# クリックしたslotを検知
data modify storage macro: util.inventory_ui.detection_slot set value "player.cursor"
function werewolf:.util/inventory_ui/0 with storage macro: util.inventory_ui

# 実行
function werewolf:.util/inventory_ui/1 with storage macro: util.inventory_ui