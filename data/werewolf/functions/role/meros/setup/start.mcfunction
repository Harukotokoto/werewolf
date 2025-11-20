##開始時に役職を表示
#title
execute as @a[tag=team_meros] run title @s title [{"text":"\uE10D","font":"role_view"}]
#sfx
execute as @a[tag=team_meros] at @s run function werewolf:asset/sfx/game_start_villager

#死亡までの時間を記録
execute store result score #GameManager hm_death run data get storage werewolf: role.meros.death_time 20
#報酬獲得までの時間を記録
execute store result score #GameManager hm_reward run data get storage werewolf: role.meros.reward_time 1200