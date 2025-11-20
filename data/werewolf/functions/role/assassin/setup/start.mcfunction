##開始時に役職を表示
#title
execute as @a[tag=team_assassin] run title @s title [{"text":"\uE006","font":"role_view"}]
#sfx
execute as @a[tag=team_assassin] at @s run function werewolf:asset/sfx/game_start_wolf

#人狼の役職本(lost)に記載されるか
execute as @a[team=assassin] run tag @s add be_written_jinrou_origin