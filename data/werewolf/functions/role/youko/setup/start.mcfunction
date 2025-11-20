##開始時に役職を表示
#title
execute as @a[tag=team_youko] run title @s title [{"text":"\uE200","font":"role_view"}]
#sfx
execute as @a[tag=team_youko] at @s run function werewolf:asset/sfx/game_start_third

#背徳者チームを処理に追加
data modify storage werewolf: active_role_list append value "haitoku"

#役職本記載
execute as @a[team=youko] run tag @s add be_written_haitoku_origin