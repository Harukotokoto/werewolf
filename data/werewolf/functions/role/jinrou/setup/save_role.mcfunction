##リザルトをテキスト変換して保存

#return判定
execute unless entity @a[tag=team_jinrou,tag=!dummy_role] run return fail


#text_display召喚
summon minecraft:text_display ~ ~ ~ {Tags:[text_saver],transformation:{right_rotation:[0f,0f,0f,1f],scale:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]}}

#入力したいテキスト
data modify entity @e[type=text_display,tag=text_saver,limit=1,sort=nearest] text set value \
'[{"interpret":true,"nbt":"role.jinrou.name","storage":"werewolf:","color":"#4e5c24"},{"text":"   "},{"selector":"@a[tag=team_jinrou,tag=!dummy_role]","color":"red","font":"default"}]'

#storageにappend
data modify storage werewolf: game_result.main append from entity @e[type=minecraft:text_display,tag=text_saver,limit=1] text

#おかたづけ
kill @e[type=minecraft:text_display,tag=text_saver]