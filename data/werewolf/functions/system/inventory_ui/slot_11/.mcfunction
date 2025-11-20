##演出
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3

##アイテムを上書き再配置
# switch_playing時
execute if data storage werewolf: {phase:switch_playing} as @s[scores={ui_ready=0}] run loot replace entity @s container.11 loot werewolf:inventory_ui/buttons/slot_11
execute if data storage werewolf: {phase:switch_playing} as @s[scores={ui_ready=1}] run loot replace entity @s container.11 loot werewolf:inventory_ui/buttons/slot_11_1
# stanby時
execute if data storage werewolf: {phase:stanby} as @s[scores={ui_ready=0}] run loot replace entity @s container.11 loot werewolf:inventory_ui/buttons/slot_11_1
execute if data storage werewolf: {phase:stanby} as @s[scores={ui_ready=1}] run loot replace entity @s container.11 loot werewolf:inventory_ui/buttons/slot_11


##クリック時の処理
# switch_playing時
execute if data storage werewolf: {phase:switch_playing} run return run tellraw @s "[システム] ゲーム開始直前のためこの機能は利用できません。"
# stanby時
#準備中なら準備完了に,準備完了なら準備中に
execute as @s[scores={ui_ready=0}] run scoreboard players set @s ui_ready 2
execute as @s[scores={ui_ready=1}] run scoreboard players set @s ui_ready 0
execute as @s[scores={ui_ready=2}] run scoreboard players set @s ui_ready 1

# 準備中のプレイヤーがいるなら通知
execute as @s[scores={ui_ready=1}] if entity @a[scores={ui_ready=0}] run tellraw @s "[システム] 他ユーザーのエントリーを待っています..."
execute as @s[scores={ui_ready=0}] if entity @a[scores={ui_ready=0}] run tellraw @s "[システム] 準備完了を取り消しました。"

# 全員が準備完了ならゲーム開始
execute unless entity @a[scores={ui_ready=0}] run function werewolf:system/phase/switch_playing/.ini