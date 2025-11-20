##村人は毎回処理
execute as @a[team=mura] run function werewolf:role/mura/setup/join

##実行
function werewolf:.util/role_processing/join/0 with storage macro: util.role_processing