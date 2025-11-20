##演出
function werewolf:asset/sfx/click

# 処理を記述
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF013"}
tellraw @s {"text":"\n"}
execute if data storage werewolf: role.kyouyuu{camp:wolf} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.kyouyuu.name","storage":"werewolf:"},{"text":"\uF826\uE507","font":"default"}]
execute if data storage werewolf: role.kyouyuu{camp:maniac} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.kyouyuu.name","storage":"werewolf:"},{"text":"\uF826\uE508","font":"default"}]
execute if data storage werewolf: role.kyouyuu{camp:villager} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.kyouyuu.name","storage":"werewolf:"},{"text":"\uF826\uE509","font":"default"}]
execute if data storage werewolf: role.kyouyuu{camp:third} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.kyouyuu.name","storage":"werewolf:"},{"text":"\uF826\uE50A","font":"default"}]

##基本設定
tellraw @s {"text":"\uF010"}
##人数
execute unless data storage werewolf: role.kyouyuu{camp:"third"} run \
execute if data storage werewolf: role.kyouyuu{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.kyouyuu.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/kyouyuu/settings/count/add"}}]
execute if data storage werewolf: role.kyouyuu{camp:"third"} if data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.kyouyuu{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.kyouyuu.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/kyouyuu/settings/count/add"}}]
execute if data storage werewolf: role.kyouyuu{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.kyouyuu{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.kyouyuu.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"第三陣営は複数入れられません"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:asset/sfx/error"}}]
$execute unless data storage werewolf: role.kyouyuu{count:0} unless data storage werewolf: role.kyouyuu{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/kyouyuu/settings/count/remove"}},{"nbt":"role.kyouyuu.count","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/kyouyuu/settings/count/add"}}]
$execute if data storage werewolf: role.kyouyuu{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/kyouyuu/settings/count/remove"}},{"nbt":"role.kyouyuu.count","storage":"werewolf:","color":"red"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]


##戻る
tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/role/"}}