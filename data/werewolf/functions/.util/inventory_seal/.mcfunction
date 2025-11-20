##inventory_seal
# player.cursorにボタン用アイテムがあるプレイヤーを対象に実行
execute as @s[predicate=werewolf:inventory_seal/slot/player.cursor/] at @s run function werewolf:.util/inventory_seal/.clicked
# ボタン配置Slotが空のプレイヤーを対象に実行
execute as @s[predicate=!werewolf:inventory_seal/slot/container/] run function werewolf:.util/inventory_seal/.set

# 流出したボタン用アイテムを削除
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["inventory_seal"]}}}}]


# 実績を開放
advancement revoke @s only werewolf:inventory_seal/