##スキル処理
#通常
$execute if entity @s[team=jinrou] run damage @a[scores={ID=$(reserve_0)},limit=1] 0.01 werewolf:skill by @s
execute if entity @s[team=jinrou] as @s at @s run function werewolf:role/jinrou/skill/slash/effect

#ダミー
$execute if entity @s[team=!jinrou] run damage @a[scores={ID=$(reserve_0)},limit=1] 1 werewolf:dummy_skill by @s
execute if entity @s[team=!jinrou] as @s at @s run function werewolf:role/jinrou/skill/slash/effect_dummy