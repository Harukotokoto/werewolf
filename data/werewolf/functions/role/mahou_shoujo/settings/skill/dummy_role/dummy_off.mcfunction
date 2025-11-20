# 処理を記述
##dummyを無効
$data modify storage werewolf: role.$(role).dummy set value false

##設定画面を更新
function werewolf:role/mahou_shoujo/settings/ with storage werewolf: role.mahou_shoujo