# 処理を記述

# 勝利陣営_1
#text_display召喚
summon minecraft:text_display ~ ~ ~ {Tags:[text_saver],transformation:{right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]}}
#入力したいテキスト
data modify entity @e[type=text_display,tag=text_saver,limit=1,sort=nearest] text set value \
'[{"text":"勝利陣営: "},{"interpret":true,"nbt":"game_result.win.camp","storage":"werewolf:"},{"text":"\\n勝利要因: "},{"interpret":true,"nbt":"game_result.win.cause","storage":"werewolf:"}]'
#storageにappend
data modify storage werewolf: game_result.output.text append from entity @e[type=minecraft:text_display,tag=text_saver,limit=1] text
#おかたづけ
kill @e[type=minecraft:text_display,tag=text_saver]

# 勝利陣営_2
execute unless data storage werewolf: game_result.win_2 run return fail
#text_display召喚
summon minecraft:text_display ~ ~ ~ {Tags:[text_saver],transformation:{right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]}}
#入力したいテキスト
data modify entity @e[type=text_display,tag=text_saver,limit=1,sort=nearest] text set value \
'[{"text":"追加勝利: "},{"interpret":true,"nbt":"game_result.win_2.camp","storage":"werewolf:"}]'
#storageにappend
data modify storage werewolf: game_result.output.text append from entity @e[type=minecraft:text_display,tag=text_saver,limit=1] text
#おかたづけ
kill @e[type=minecraft:text_display,tag=text_saver]