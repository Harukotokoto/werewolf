## チャージ(ダミー)

## 時間管理
execute as @s[scores={charge_roar=0..}] run scoreboard players add @s charge_roar 1
execute as @s[scores={charge_roar=1}] at @s run playsound entity.player.breath master @s ~ ~ ~ 1 1 0.5
execute as @s[scores={charge_roar=1}] run effect give @s slowness 1 3 true
#発砲
execute as @s[scores={charge_roar=10}] at @s run function werewolf:role/jinrou/skill/roar/main_3_dummy
#チャージ用のスコアボードをリセット
execute as @s[scores={charge_roar=15..}] run scoreboard players reset @s charge_roar