# 処理を記述
##dummyを無効
$data modify storage werewolf: role.$(role).dummy set value false

##設定画面を更新
function werewolf:role/ponkotsu/settings/ with storage werewolf: role.ponkotsu