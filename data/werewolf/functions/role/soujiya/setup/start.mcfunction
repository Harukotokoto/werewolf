##開始時に役職を表示
#title
execute as @a[tag=team_soujiya] run title @s title [{"text":"\uE104","font":"role_view"}]
#sfx
execute as @a[tag=team_soujiya] at @s run function werewolf:asset/sfx/game_start_villager
