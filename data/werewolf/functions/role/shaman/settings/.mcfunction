# 処理を記述
##演出
function werewolf:asset/sfx/click

tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF013"}
tellraw @s {"text":"\n"}
execute if data storage werewolf: role.shaman{camp:wolf} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.shaman.name","storage":"werewolf:"},{"text":"\uF826\uE507","font":"default"}]
execute if data storage werewolf: role.shaman{camp:maniac} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.shaman.name","storage":"werewolf:"},{"text":"\uF826\uE508","font":"default"}]
execute if data storage werewolf: role.shaman{camp:villager} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.shaman.name","storage":"werewolf:"},{"text":"\uF826\uE509","font":"default"}]
execute if data storage werewolf: role.shaman{camp:third} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.shaman.name","storage":"werewolf:"},{"text":"\uF826\uE50A","font":"default"}]

##基本設定
tellraw @s {"text":"\uF010"}
##人数
execute unless data storage werewolf: role.shaman{camp:"third"} run \
execute if data storage werewolf: role.shaman{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.shaman.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/count/add"}}]
execute if data storage werewolf: role.shaman{camp:"third"} if data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.shaman{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.shaman.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/count/add"}}]
execute if data storage werewolf: role.shaman{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.shaman{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.shaman.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"第三陣営は複数入れられません"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:asset/sfx/error"}}]
$execute unless data storage werewolf: role.shaman{count:0} unless data storage werewolf: role.shaman{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/count/remove"}},{"nbt":"role.shaman.count","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/count/add"}}]
$execute if data storage werewolf: role.shaman{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/count/remove"}},{"nbt":"role.shaman.count","storage":"werewolf:","color":"red"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##スキル設定
tellraw @s {"text":"\uF011"}
##霊視
#クールタイム
execute if data storage werewolf: role.shaman.skill_0{cooltime:1} run tellraw @s [{"text":"　[霊視] 回復日数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.shaman.skill_0.cooltime","storage":"werewolf:","color":"white"},{"text":"日"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/cooltime/add"}}]
execute unless data storage werewolf: role.shaman.skill_0{cooltime:1} unless data storage werewolf: role.shaman.skill_0{cooltime:5} run tellraw @s [{"text":"　[霊視] 回復日数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/cooltime/remove"}},{"nbt":"role.shaman.skill_0.cooltime","storage":"werewolf:"},{"text":"日"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/cooltime/add"}}]
execute if data storage werewolf: role.shaman.skill_0{cooltime:5} run tellraw @s [{"text":"　[霊視] 回復日数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/cooltime/remove"}},{"nbt":"role.shaman.skill_0.cooltime","storage":"werewolf:","color":"red"},{"text":"日"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]
#最大回数
execute if data storage werewolf: role.shaman.skill_0{limit:1} run tellraw @s [{"text":"　[霊視] 最大回数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.shaman.skill_0.limit","storage":"werewolf:","color":"white"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"回数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/limit/add"}}]
execute unless data storage werewolf: role.shaman.skill_0{limit:1} unless data storage werewolf: role.shaman.skill_0{limit:999} run tellraw @s [{"text":"　[霊視] 最大回数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"回数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/limit/remove"}},{"nbt":"role.shaman.skill_0.limit","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"回数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/limit/add"}}]
execute if data storage werewolf: role.shaman.skill_0{limit:999} run tellraw @s [{"text":"　[霊視] 最大回数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"回数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/shaman/settings/skill/limit/remove"}},{"text":"∞","color":"white"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##戻る
tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/role/"}}