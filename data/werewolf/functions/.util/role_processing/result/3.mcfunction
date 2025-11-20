# 結果出力
#text_display召喚
summon minecraft:text_display ~ ~ ~ {Tags:[text_saver],transformation:{right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]}}
#入力したいテキスト
data modify entity @e[type=text_display,tag=text_saver,limit=1,sort=nearest] text set value \
'[{"interpret":true,"nbt":"util.role_processing.result","storage":"macro:"}]'
#storageにappend
data modify storage werewolf: game_result.output.text append from entity @e[type=minecraft:text_display,tag=text_saver,limit=1] text
#おかたづけ
kill @e[type=minecraft:text_display,tag=text_saver]

# データが無ければreturn
$execute unless data storage werewolf: game_result.sub[$(count)] run return run data modify storage macro: util.role_processing.count set value 0


# 再帰後の処理対象を更新
$data modify storage macro: util.role_processing.result set from storage werewolf: game_result.sub[$(count)]
# カウントアップ
execute unless data storage macro: util.role_processing{count:0} run execute store result storage macro: util.role_processing.count int -1 run data get storage macro: util.role_processing.count -1.01
execute if data storage macro: util.role_processing{count:0} run data modify storage macro: util.role_processing.count set value 1


# 再帰処理
function werewolf:.util/role_processing/result/3 with storage macro: util.role_processing