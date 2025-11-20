##スキル処理
# 共通
$tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"aqua"},{"text":"を背徳者として従えた。","color":"aqua"}]
$execute at @a[scores={ID=$(reserve_0)}] run particle soul_fire_flame ~ ~1 ~ 0.5 0.5 0.5 0 10 force @s
$execute at @a[scores={ID=$(reserve_0)}] run playsound minecraft:entity.blaze.shoot master @s

# 通常
$execute if entity @s[team=youko] as @a[scores={ID=$(reserve_0)}] at @s run function werewolf:role/youko/skill/main_2

# ダミー