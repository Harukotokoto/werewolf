function werewolf:.util/role_processing/count/reload_active_role_list/

data modify storage macro: reserve_0 set from storage werewolf: role.mura.id
data modify storage macro: reserve_1 set from storage werewolf: role.mura.name
execute store result storage macro: reserve_2 int 1 if entity @a[team=mura]

##実行
function werewolf:.util/role_processing/count/reload_active_role_list_in_game/0 with storage macro: