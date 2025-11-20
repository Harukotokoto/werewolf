##役職のマーカーを召喚
data modify storage macro: reserve_0 set value 'result'
data modify storage macro: reserve_1 set value 0
function werewolf:item/job_change_villager/0 with storage macro:
##村人のarmor_standをキル
kill @e[type=armor_stand,tag=job_change_villager_role,team=mura]

##抽選
tag @e[type=armor_stand,tag=job_change_villager_role,sort=random,limit=1] add this_role_as

##抽選対象がなければreturn
execute unless entity @e[type=armor_stand,tag=this_role_as] run return run tellraw @s {"text":"この村で就ける役職は無いようだ。","color":"red"}

##役職を取得
execute as @e[type=armor_stand,tag=this_role_as,limit=1] run function werewolf:.util/role_processing/get_role/
kill @e[type=armor_stand,tag=job_change_villager_role]

##役職処理を実行
function werewolf:item/job_change_villager/1 with storage macro: