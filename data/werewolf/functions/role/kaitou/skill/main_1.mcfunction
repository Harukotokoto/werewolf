##スキル処理
# ダミー
execute if entity @s[team=!kaitou] at @s run function werewolf:role/kaitou/skill/effect_dummy
$execute if entity @s[team=!kaitou] run tellraw @s [{"text":"","color":"green"},{"text":"あなたは"},{"selector":"@a[scores={ID=$(reserve_0)},limit=1]"},{"text":"の役職を奪った。"}]
execute if entity @s[team=!kaitou] at @s if data storage werewolf: role.kaitou{talk:true} run function werewolf:role/kaitou/skill/talking/.skill

# 通常
execute if entity @s[team=kaitou] at @s run function werewolf:role/kaitou/skill/main_2 with storage macro: