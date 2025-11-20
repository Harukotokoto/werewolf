## チャージ(通常)

## 時間管理
execute as @s[scores={charge_cupid_arrow=0..}] run scoreboard players add @s charge_cupid_arrow 1
#発砲
execute as @s[scores={charge_cupid_arrow=1}] at @s run function werewolf:role/cupid/skill/main_3
#チャージ用のスコアボードをリセット
execute as @s[scores={charge_cupid_arrow=6..}] run scoreboard players reset @s charge_cupid_arrow