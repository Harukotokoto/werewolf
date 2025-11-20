##スキル処理
#共通
$tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)}]","color":"green"},{"text":"を守護した。","color":"green"}]

# 通常
$execute if entity @s[team=kishi] run scoreboard players set @s protected_new $(reserve_0)
$execute if entity @s[team=kishi] run tag @a[scores={ID=$(reserve_0)}] add protected

# ダミー
$execute if entity @s[team=!kishi] run scoreboard players set @s protected_dummy_new $(reserve_0)
$execute if entity @s[team=!kishi] run tag @a[scores={ID=$(reserve_0)}] add protected_dummy