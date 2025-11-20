##開始時に役職を表示
#title
execute as @a[tag=team_cupid] run title @s title [{"text":"\uE202","font":"role_view"}]
#sfx
execute as @a[tag=team_cupid] at @s run function werewolf:asset/sfx/game_start_third
