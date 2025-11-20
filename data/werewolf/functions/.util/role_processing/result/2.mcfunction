# 処理を記述

#データがなければreturn
execute unless data storage werewolf: game_result.main[0] run return fail

# 結果出力
#text_display召喚
summon minecraft:text_display ~ ~ ~ {Tags:[text_saver],transformation:{right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]}}
#入力したいテキスト
data modify entity @e[type=text_display,tag=text_saver,limit=1,sort=nearest] text set value \
'[{"interpret":true,"nbt":"game_result.main[0]","storage":"werewolf:"}]'
#storageにappend
data modify storage werewolf: game_result.output.text append from entity @e[type=minecraft:text_display,tag=text_saver,limit=1] text
#おかたづけ
kill @e[type=minecraft:text_display,tag=text_saver]

# データ削除
data remove storage werewolf: game_result.main[0]

# 再帰処理
function werewolf:.util/role_processing/result/2