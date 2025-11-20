##開始時に役職を表示
#title
execute as @a[team=ponkotsu,tag=!dummy_role] run title @s title [{"text":"\uE107","font":"role_view"}]
#sfx
execute as @a[team=ponkotsu,tag=!dummy_role] at @s run function werewolf:asset/sfx/game_start_villager