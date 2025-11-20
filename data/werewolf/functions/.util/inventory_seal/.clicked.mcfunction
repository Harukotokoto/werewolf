# クリックしたslotを検知
data modify storage macro: util.inventory_seal.detection_slot set value "player.cursor"
function werewolf:.util/inventory_seal/0 with storage macro: util.inventory_seal

# 実行
function werewolf:.util/inventory_seal/1 with storage macro: util.inventory_seal