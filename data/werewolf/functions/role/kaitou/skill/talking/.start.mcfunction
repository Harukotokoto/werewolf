##語り
execute unless data storage werewolf: {phase:"playing"} run return fail
execute as @a[tag=team_kaitou_origin,scores={ID=1..}] run function werewolf:role/kaitou/skill/talking/.start_1