# 処理を記述
##記録
$execute unless data storage werewolf: role.$(result){count:0} run data modify storage macro: reserve_1 set value '{"interpret":true,"nbt":"role.$(result).name","storage":"werewolf:","hoverEvent":{"action":"show_text","contents":[{"interpret":true,"nbt":"role.$(result).name","storage":"werewolf:","font":"role_hover"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/$(result)/settings/ with storage werewolf: role.$(result)"}},{"text":"  "},'
$execute if data storage werewolf: role.$(result){count:0} run data modify storage macro: reserve_1 set value '{"interpret":true,"nbt":"role.$(result).name","storage":"werewolf:","color":"#808080","hoverEvent":{"action":"show_text","contents":[{"interpret":true,"nbt":"role.$(result).name","storage":"werewolf:","font":"role_hover"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/$(result)/settings/ with storage werewolf: role.$(result)"}},{"text":"  "},'

##結合
function werewolf:.util/strings_compound/

##改行
#カウントアップ
execute store result storage macro: reserve_2 int -1 run data get storage macro: reserve_2 -1.01
#改行する
execute if data storage macro: {reserve_2:6} run data modify storage macro: reserve_1 set value '{"interpret":true,"nbt":"reserve_3","storage":"macro:"},'
execute if data storage macro: {reserve_2:6} run function werewolf:.util/strings_compound/
execute if data storage macro: {reserve_2:6} run data modify storage macro: reserve_2 set value 1
