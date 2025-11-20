##開始時に役職を表示
#title
execute as @a[tag=team_kyoujin] run title @s title [{"text":"\uE003","font":"role_view"}]
#sfx
execute as @a[tag=team_kyoujin] at @s run function werewolf:asset/sfx/game_start_wolf
