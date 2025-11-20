##スキル処理
# 通常
$execute if entity @s[team=uranai] if entity @a[tag=!camp_wolf,team=!youko,scores={ID=$(reserve_0)}] run tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"green"},{"text":"は人狼ではないようだ。","color":"green"}]
$execute if entity @s[team=uranai] if entity @a[tag=camp_wolf,scores={ID=$(reserve_0)}] run tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"red"},{"text":"は人狼のようだ。","color":"red"}]
$execute if entity @s[team=uranai] if entity @a[team=youko,scores={ID=$(reserve_0)}] run tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"aqua"},{"text":"は妖狐だったようだ。","color":"aqua"}]
#妖狐処理
$execute as @a[team=youko,scores={ID=$(reserve_0)}] at @s run function werewolf:role/uranai/skill/main_2


# ダミー
$execute if entity @s[team=!uranai] run tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"green"},{"text":"は人狼ではないようだ。","color":"green"}]