##スキル処理
# 通常
execute if entity @s[team=wanashi] run function werewolf:role/wanashi/skill/main_2

# ダミー
execute if entity @s[team=!wanashi] run function werewolf:role/wanashi/skill/main_2_dummy