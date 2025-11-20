## inventory_seal
# 封印Slotが空のプレイヤーを対象に実行
execute as @a[predicate=!werewolf:inventory_seal/slot/container/] run function werewolf:.util/inventory_seal/.set

## ゲーム処理
function werewolf:system/phase/playing

## 勝利判定
execute if data storage werewolf: {phase:"playing"} run function werewolf:system/phase/victory_judge