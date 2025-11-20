##スキル処理
# ダミー
$execute if entity @s[team=!shinigami] run damage @a[scores={ID=$(reserve_0)},limit=1] 1 werewolf:dummy_skill by @s
execute if entity @s[team=!shinigami] at @s run function werewolf:role/shinigami/skill/effect_dummy
$execute if entity @s[team=!shinigami] run tellraw @s [{"text":"","color":"aqua"},{"text":"あなたは"},{"selector":"@a[scores={ID=$(reserve_0)},limit=1]"},{"text":"の能力を複写した。"}]

# 通常
execute if entity @s[team=shinigami] at @s run function werewolf:role/shinigami/skill/main_2 with storage macro: