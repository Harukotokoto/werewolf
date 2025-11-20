##演出
#playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3

##アイテムを上書き再配置
loot replace entity @s container.10 loot werewolf:inventory_ui/buttons/slot_10

##クリック時の処理
# switch_playing時
execute if data storage werewolf: {phase:switch_playing} run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3
execute if data storage werewolf: {phase:switch_playing} run return run tellraw @s "[システム] ゲーム開始直前のためこの機能は利用できません。"
# stanby時
#設定を開く
function werewolf:settings/.menu/