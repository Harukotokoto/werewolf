##開始時に役職を表示
#title
execute as @a[tag=team_kyoushin] run title @s title [{"text":"\uE004","font":"role_view"}]
#sfx
execute as @a[tag=team_kyoushin] at @s run function werewolf:asset/sfx/game_start_wolf
