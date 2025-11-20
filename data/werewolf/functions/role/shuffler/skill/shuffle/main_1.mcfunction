##スキル処理
#通常
execute if entity @s[team=shuffler] run function werewolf:role/shuffler/skill/shuffle/main_2

#ダミー
execute if entity @s[team=!shuffler] run function werewolf:role/shuffler/skill/shuffle/main_4