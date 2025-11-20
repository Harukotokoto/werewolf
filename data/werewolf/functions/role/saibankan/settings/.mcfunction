# 処理を記述
##演出
function werewolf:asset/sfx/click

tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF013"}
tellraw @s {"text":"\n"}
execute if data storage werewolf: role.saibankan{camp:wolf} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.saibankan.name","storage":"werewolf:"},{"text":"\uF826\uE507","font":"default"}]
execute if data storage werewolf: role.saibankan{camp:maniac} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.saibankan.name","storage":"werewolf:"},{"text":"\uF826\uE508","font":"default"}]
execute if data storage werewolf: role.saibankan{camp:villager} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.saibankan.name","storage":"werewolf:"},{"text":"\uF826\uE509","font":"default"}]
execute if data storage werewolf: role.saibankan{camp:third} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.saibankan.name","storage":"werewolf:"},{"text":"\uF826\uE50A","font":"default"}]

##基本設定
tellraw @s {"text":"\uF010"}
##人数
execute unless data storage werewolf: role.saibankan{camp:"third"} run \
execute if data storage werewolf: role.saibankan{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.saibankan.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/saibankan/settings/count/add"}}]
execute if data storage werewolf: role.saibankan{camp:"third"} if data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.saibankan{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.saibankan.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/saibankan/settings/count/add"}}]
execute if data storage werewolf: role.saibankan{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.saibankan{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.saibankan.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"第三陣営は複数入れられません"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:asset/sfx/error"}}]
$execute unless data storage werewolf: role.saibankan{count:0} unless data storage werewolf: role.saibankan{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/saibankan/settings/count/remove"}},{"nbt":"role.saibankan.count","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/saibankan/settings/count/add"}}]
$execute if data storage werewolf: role.saibankan{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/saibankan/settings/count/remove"}},{"nbt":"role.saibankan.count","storage":"werewolf:","color":"red"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##その他設定
tellraw @s {"text":"\uF012"}
##裁判時間
execute if data storage werewolf: settings.time.trial{second:10} run tellraw @s [{"text":"  裁判時間: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"settings.time.trial.second","storage":"werewolf:","color":"white"},{"text":"秒"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/time/add"}}]
execute unless data storage werewolf: settings.time.trial{second:10} unless data storage werewolf: settings.time.trial{second:600} run tellraw @s [{"text":"  裁判時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/time/remove"}},{"nbt":"settings.time.trial.second","storage":"werewolf:"},{"text":"秒"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/time/add"}}]
execute if data storage werewolf: settings.time.trial{second:600} run tellraw @s [{"text":"  裁判時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/time/remove"}},{"nbt":"settings.time.trial.second","storage":"werewolf:","color":"red"},{"text":"秒"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]
##吊りスキップ
execute if data storage werewolf: settings.trial{must_hang:true} run tellraw @s [{"text":"  吊りスキップ: "},{"text":"\uF001","clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/must_hang/false"}}]
execute if data storage werewolf: settings.trial{must_hang:false} run tellraw @s [{"text":"  吊りスキップ: "},{"text":"\uF000","clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/must_hang/true"}}]
##裁判後の墓消滅
execute if data storage werewolf: settings.trial{delete_grave:false} run tellraw @s [{"text":"  裁判後の墓消滅: "},{"text":"\uF001","clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/delete_grave/true"}}]
execute if data storage werewolf: settings.trial{delete_grave:true} run tellraw @s [{"text":"  裁判後の墓消滅: "},{"text":"\uF000","clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/settings/delete_grave/false"}}]

##戻る
tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/role/"}}