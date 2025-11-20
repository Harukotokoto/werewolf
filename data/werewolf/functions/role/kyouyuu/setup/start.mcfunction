##開始時に役職を表示
#title
execute as @a[tag=team_kyouyuu] run title @s title [{"text":"\uE105","font":"role_view"}]
#sfx
execute as @a[tag=team_kyouyuu] at @s run function werewolf:asset/sfx/game_start_villager


#共有者の役職本(lost)に記載されるか
execute as @a[team=kyouyuu] run tag @s add be_written_kyouyuu_origin