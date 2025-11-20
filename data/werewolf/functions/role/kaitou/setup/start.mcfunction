##開始時に役職を表示
#title
execute as @a[tag=team_kaitou] run title @s title [{"text":"\uE10B","font":"role_view"}]
#sfx
execute as @a[tag=team_kaitou] at @s run function werewolf:asset/sfx/game_start_villager

#怪盗の語り用タグ
execute as @a[tag=team_kaitou] run tag @s add team_kaitou_origin

#初動の語り
scoreboard players set @a[tag=team_kaitou] talk_kaitou 0
execute if data storage werewolf: role.kaitou{talk:true} run schedule function werewolf:role/kaitou/skill/talking/.start 5s