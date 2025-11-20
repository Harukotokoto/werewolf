## 墓のアナウンス

# 墓のID取得
execute at @s run function werewolf:.util/eye_detection/interaction/


# 通常
execute as @s[tag=!team_reinou] run function werewolf:system/death/grave/announce_2 with storage macro:

# 霊能者(dummy含む)
execute as @s[tag=team_reinou] run function werewolf:system/death/grave/announce_3 with storage macro:

# シャーマン(dummy含む)
execute as @s[tag=team_shaman] run function werewolf:system/death/grave/announce_3 with storage macro:

# シャーマン(dummy含む)
execute as @s[tag=team_necromancer] run function werewolf:system/death/grave/announce_4 with storage macro: