##開始時に役職を表示
#title
execute as @a[tag=team_teruteru] run title @s title [{"text":"\uE10A","font":"role_view"}]
#sfx
execute as @a[tag=team_teruteru] at @s run function werewolf:asset/sfx/game_start_third
