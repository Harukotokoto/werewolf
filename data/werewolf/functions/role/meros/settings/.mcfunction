# 処理を記述
##演出
function werewolf:asset/sfx/click

tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF013"}
tellraw @s {"text":"\n"}
execute if data storage werewolf: role.meros{camp:wolf} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.meros.name","storage":"werewolf:"},{"text":"\uF826\uE507","font":"default"}]
execute if data storage werewolf: role.meros{camp:maniac} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.meros.name","storage":"werewolf:"},{"text":"\uF826\uE508","font":"default"}]
execute if data storage werewolf: role.meros{camp:villager} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.meros.name","storage":"werewolf:"},{"text":"\uF826\uE509","font":"default"}]
execute if data storage werewolf: role.meros{camp:third} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.meros.name","storage":"werewolf:"},{"text":"\uF826\uE50A","font":"default"}]

##基本設定
tellraw @s {"text":"\uF010"}
##人数
execute unless data storage werewolf: role.meros{camp:"third"} run \
execute if data storage werewolf: role.meros{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.meros.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/count/add"}}]
execute if data storage werewolf: role.meros{camp:"third"} if data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.meros{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.meros.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/count/add"}}]
execute if data storage werewolf: role.meros{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.meros{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.meros.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"第三陣営は複数入れられません"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:asset/sfx/error"}}]
$execute unless data storage werewolf: role.meros{count:0} unless data storage werewolf: role.meros{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/count/remove"}},{"nbt":"role.meros.count","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/count/add"}}]
$execute if data storage werewolf: role.meros{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/count/remove"}},{"nbt":"role.meros.count","storage":"werewolf:","color":"red"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##その他設定
tellraw @s {"text":"\uF012"}
##走れメロスの一声
#停止許容時間
execute if data storage werewolf: role.meros{death_time:1} run tellraw @s [{"text":"　停止許容時間: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.meros.death_time","storage":"werewolf:","color":"white"},{"text":"秒"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/death_time/add"}}]
execute unless data storage werewolf: role.meros{death_time:1} unless data storage werewolf: role.meros{death_time:10} run tellraw @s [{"text":"　停止許容時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/death_time/remove"}},{"nbt":"role.meros.death_time","storage":"werewolf:"},{"text":"秒"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/death_time/add"}}]
execute if data storage werewolf: role.meros{death_time:10} run tellraw @s [{"text":"　停止許容時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/death_time/remove"}},{"nbt":"role.meros.death_time","storage":"werewolf:","color":"red"},{"text":"秒"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]
#報酬獲得までの時間
execute if data storage werewolf: role.meros{reward_time:1} run tellraw @s [{"text":"　報酬獲得までの時間: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.meros.reward_time","storage":"werewolf:","color":"white"},{"text":"分"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/reward_time/add"}}]
execute unless data storage werewolf: role.meros{reward_time:1} unless data storage werewolf: role.meros{reward_time:20} run tellraw @s [{"text":"　報酬獲得までの時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/reward_time/remove"}},{"nbt":"role.meros.reward_time","storage":"werewolf:"},{"text":"分"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/reward_time/add"}}]
execute if data storage werewolf: role.meros{reward_time:20} run tellraw @s [{"text":"　報酬獲得までの時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/meros/settings/skill/reward_time/remove"}},{"nbt":"role.meros.reward_time","storage":"werewolf:","color":"red"},{"text":"分"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##戻る
tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/role/"}}