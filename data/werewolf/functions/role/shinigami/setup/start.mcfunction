##開始時に役職を表示
#title
execute as @a[tag=team_shinigami] run title @s title [{"text":"\uE201","font":"role_view"}]
#sfx
execute as @a[tag=team_shinigami] at @s run function werewolf:asset/sfx/game_start_third
