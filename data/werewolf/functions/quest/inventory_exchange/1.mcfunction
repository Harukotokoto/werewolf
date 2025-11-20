## シャッフル処理-1

#inventory_sealを一時的にoffに
data modify storage werewolf: system.inventory_seal set value false

#すり替え前tagを追加/自分のhotbar0~6 + offhand を使用禁止インベントリに複製
execute as @a[tag=player] run function werewolf:quest/inventory_exchange/2

#各々交換
execute as @a[tag=player,tag=not_yet_ie,sort=random] run function werewolf:quest/inventory_exchange/3

#inventory_sealをonに
data modify storage werewolf: system.inventory_seal set value true

#不要なアイテムを削除
function werewolf:.util/inventory_seal/.trigger