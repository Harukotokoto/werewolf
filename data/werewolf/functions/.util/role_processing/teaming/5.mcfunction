##プレイヤー内に狼がいない場合の処理
#チームとタグをリセット
execute as @e[tag=role_assigning] run team join _entrant
execute as @a[tag=role_assigning] run tag @s remove wolf_tentative
execute as @a[tag=role_assigning] run tag @s remove villager_tentative

##役職を割り振る
function werewolf:.util/role_processing/teaming/3 with storage macro: util.role_processing

##プレイヤー内に狼/村の双方存在すれば再帰を抜ける
execute if entity @a[tag=wolf_tentative] if entity @a[tag=villager_tentative] run return fail

##プレイヤー内に狼/村がいない場合は再帰
function werewolf:.util/role_processing/teaming/5