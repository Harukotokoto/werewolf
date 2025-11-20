##スキル処理
# 通常
$execute if entity @s[team=reinou] if entity @a[tag=!camp_wolf,scores={ID=$(reserve_0)}] run tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"green"},{"text":"は人狼ではなかったようだ。","color":"green"}]
$execute if entity @s[team=reinou] if entity @a[tag=camp_wolf,scores={ID=$(reserve_0)}] run tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"red"},{"text":"は人狼だったようだ。","color":"red"}]


# ダミー
$execute if entity @s[team=!reinou] run tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"green"},{"text":"は人狼ではなかったようだ。","color":"green"}]