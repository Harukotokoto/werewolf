# 処理を記述
##演出
function werewolf:asset/sfx/click

tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF013"}
tellraw @s {"text":"\n"}
execute if data storage werewolf: role.ponkotsu{camp:wolf} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.ponkotsu.name","storage":"werewolf:"},{"text":"\uF826\uE507","font":"default"}]
execute if data storage werewolf: role.ponkotsu{camp:maniac} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.ponkotsu.name","storage":"werewolf:"},{"text":"\uF826\uE508","font":"default"}]
execute if data storage werewolf: role.ponkotsu{camp:villager} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.ponkotsu.name","storage":"werewolf:"},{"text":"\uF826\uE509","font":"default"}]
execute if data storage werewolf: role.ponkotsu{camp:third} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.ponkotsu.name","storage":"werewolf:"},{"text":"\uF826\uE50A","font":"default"}]
##基本設定
tellraw @s {"text":"\uF010"}
##人数
execute unless data storage werewolf: role.ponkotsu{camp:"third"} run \
execute if data storage werewolf: role.ponkotsu{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.ponkotsu.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/ponkotsu/settings/count/add"}}]
execute if data storage werewolf: role.ponkotsu{camp:"third"} if data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.ponkotsu{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.ponkotsu.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/ponkotsu/settings/count/add"}}]
execute if data storage werewolf: role.ponkotsu{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.ponkotsu{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.ponkotsu.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"第三陣営は複数入れられません"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:asset/sfx/error"}}]
$execute unless data storage werewolf: role.ponkotsu{count:0} unless data storage werewolf: role.ponkotsu{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/ponkotsu/settings/count/remove"}},{"nbt":"role.ponkotsu.count","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/ponkotsu/settings/count/add"}}]
$execute if data storage werewolf: role.ponkotsu{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/ponkotsu/settings/count/remove"}},{"nbt":"role.ponkotsu.count","storage":"werewolf:","color":"red"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##その他設定
tellraw @s {"text":"\uF012"}
##ダミー選択
execute if data storage werewolf: role.ponkotsu{dummy_wolf:true} run tellraw @s [{"text":"  ダミー役職陣営: "},{"text":"< 人狼役職入り >","color":"red","clickEvent":{"action":"run_command","value":"/function werewolf:role/ponkotsu/settings/skill/dummy_role/dummy_wolf_off"}}]
execute if data storage werewolf: role.ponkotsu{dummy_wolf:false} run tellraw @s [{"text":"  ダミー役職陣営: "},{"text":"< 人狼役職抜き >","color":"green","clickEvent":{"action":"run_command","value":"/function werewolf:role/ponkotsu/settings/skill/dummy_role/dummy_wolf_on"}}]
tellraw @s {"text":"  ダミー役職選択(ポンコツ系共通)"}
function werewolf:role/ponkotsu/settings/skill/dummy_role/

##戻る
tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/role/"}}