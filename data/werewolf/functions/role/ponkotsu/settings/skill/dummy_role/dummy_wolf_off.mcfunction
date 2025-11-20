# 処理を記述
##狼役職を無効
data modify storage werewolf: role.ponkotsu.dummy_wolf set value false

##設定画面を更新
function werewolf:role/ponkotsu/settings/ with storage werewolf: role.ponkotsu