##開始時に役職を表示
#title
execute as @a[tag=team_saibankan] run title @s title [{"text":"\uE109","font":"role_view"}]
#sfx
execute as @a[tag=team_saibankan] at @s run function werewolf:asset/sfx/game_start_villager
