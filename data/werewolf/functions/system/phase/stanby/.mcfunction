##bossbar更新
function werewolf:settings/reload_ui/
function werewolf:system/bossbar/settings/advance/


##inventory_ui
# ボタン配置Slotが空のプレイヤーを対象に実行
execute as @a[predicate=!werewolf:inventory_ui/slot/container/] run function werewolf:.util/inventory_ui/.set


##値を持っていないプレイヤーの処理
execute as @a[team=!_entrant,team=!_spectator] run function werewolf:system/phase/stanby/0
execute as @a unless score @s ui_ready matches 0.. run function werewolf:system/phase/stanby/0

##ダメージ/空腹防止
execute run effect give @a instant_health infinite 252 true
execute run effect give @a saturation infinite 252 true