##演出
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3

##アイテムを上書き再配置
# switch_playing時
execute if data storage werewolf: {phase:switch_playing} as @s[team=_entrant] run loot replace entity @s container.9 loot werewolf:inventory_ui/buttons/slot_9
execute if data storage werewolf: {phase:switch_playing} as @s[team=_spectator] run loot replace entity @s container.9 loot werewolf:inventory_ui/buttons/slot_9_1
# stanby時
execute if data storage werewolf: {phase:stanby} as @s[team=_entrant] run loot replace entity @s container.9 loot werewolf:inventory_ui/buttons/slot_9_1
execute if data storage werewolf: {phase:stanby} as @s[team=_spectator] run loot replace entity @s container.9 loot werewolf:inventory_ui/buttons/slot_9


##クリック時の処理
# switch_playing時
execute if data storage werewolf: {phase:switch_playing} run return run tellraw @s "[システム] ゲーム開始直前のためこの機能は利用できません。"
# stanby時
#参加なら観戦に,観戦なら参加に
execute as @s[team=_entrant] run team leave @s
team join _entrant @s[team=_spectator]
team join _spectator @s[team=!_entrant]
#クリックを通知
execute as @s[team=_entrant] run tellraw @s "[システム] ゲームモードを参加に変更しました。"
execute as @s[team=_spectator] run tellraw @s "[システム] ゲームモードを観戦に変更しました。"