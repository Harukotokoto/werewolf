##スキル処理
# 通常
#成功
$execute if entity @s[team=soujiya] unless entity @a[tag=camp_villager,scores={ID=$(reserve_0)}] unless entity @a[tag=camp_third,scores={ID=$(reserve_0)}] at @s run return run function werewolf:role/soujiya/skill/main_2 with storage macro:
#失敗
execute if entity @s[team=soujiya] at @s run function werewolf:role/soujiya/skill/main_3 with storage macro:


# ダミー
execute if entity @s[team=!soujiya] run function werewolf:role/soujiya/skill/main_4 with storage macro: