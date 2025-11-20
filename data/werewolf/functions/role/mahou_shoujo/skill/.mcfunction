##ダミーになり得る役職のマーカーを召喚
data modify storage macro: reserve_0 set value 'result'
data modify storage macro: reserve_1 set value 0
execute if data storage werewolf: role.mahou_shoujo{first_dummy:true} run function werewolf:role/mahou_shoujo/skill/0 with storage macro:

##抽選
tag @e[type=armor_stand,tag=mahou_shoujo_role,sort=random,limit=1] add dummy_role_as

##抽選対象がなければreturn
execute unless entity @e[type=armor_stand,tag=dummy_role_as] run return fail

##役職を取得
execute as @e[type=armor_stand,tag=dummy_role_as,limit=1] run function werewolf:.util/role_processing/get_role/
kill @e[type=armor_stand,tag=mahou_shoujo_role]

##役職処理を実行
function werewolf:role/mahou_shoujo/skill/1 with storage macro:

##タグ付け
tag @s add this_mahou_shoujo