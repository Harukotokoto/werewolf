# 処理を記述
$execute unless data storage werewolf: role.$(result){count:0} if data storage werewolf: role.$(result).count run \
function werewolf:.util/role_processing/count/reload_active_role_list/2 with storage macro: util.role_processing

execute if data storage macro: util.role_processing{result:"mura"} run function werewolf:.util/role_processing/count/reload_active_role_list/2 with storage macro: util.role_processing