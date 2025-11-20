##inventory_ui
# player.cursorにボタン用アイテムがあるプレイヤーを対象に実行
execute as @s[predicate=werewolf:inventory_ui/slot/player.cursor/] at @s run function werewolf:.util/inventory_ui/.clicked
# ボタン配置Slotが空のプレイヤーを対象に実行
execute as @s[predicate=!werewolf:inventory_ui/slot/container/] run function werewolf:.util/inventory_ui/.set

# 流出したボタン用アイテムを削除
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["inventory_ui"]}}}}]


# 実績を開放
advancement revoke @s only werewolf:inventory_ui/