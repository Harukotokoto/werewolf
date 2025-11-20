##スキル処理
#通常
$execute if entity @s[team=assassin] run damage @a[scores={ID=$(reserve_0)},limit=1] 0.01 werewolf:skill by @s
execute if entity @s[team=assassin] as @s at @s run function werewolf:role/assassin/skill/effect
execute if entity @s[team=assassin] as @s at @s run function werewolf:role/assassin/skill/main_2

#ダミー
$execute if entity @s[team=!assassin] run damage @a[scores={ID=$(reserve_0)},limit=1] 1 werewolf:dummy_skill by @s
execute if entity @s[team=!assassin] as @s at @s run function werewolf:role/assassin/skill/effect_dummy