##選択役職リストをリセット
data remove storage werewolf: active_role_list

##役職内人数をリセット(wolf/maniac/villager/third)
data modify storage werewolf: camp_details.count.wolf set value 0
data modify storage werewolf: camp_details.count.maniac set value 0
data modify storage werewolf: camp_details.count.villager set value 0
data modify storage werewolf: camp_details.count.third set value 0

##実行
function werewolf:.util/role_processing/count/reload_active_role_list/0 with storage macro: util.role_processing