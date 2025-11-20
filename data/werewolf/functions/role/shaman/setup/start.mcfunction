##開始時に役職を表示
#title
execute as @a[tag=team_shaman] run title @s title [{"text":"\uE10E","font":"role_view"}]
#sfx
execute as @a[tag=team_shaman] at @s run function werewolf:asset/sfx/game_start_villager
