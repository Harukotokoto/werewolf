##開始時に役職を表示
#title
execute as @a[tag=team_ojousama] run title @s title [{"text":"\uE108","font":"role_view"}]
#sfx
execute as @a[tag=team_ojousama] at @s run function werewolf:asset/sfx/game_start_villager
