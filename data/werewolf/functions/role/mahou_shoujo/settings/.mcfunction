# 処理を記述
##演出
function werewolf:asset/sfx/click

tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF013"}
tellraw @s {"text":"\n"}
execute if data storage werewolf: role.mahou_shoujo{camp:wolf} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.mahou_shoujo.name","storage":"werewolf:"},{"text":"\uF826\uE507","font":"default"}]
execute if data storage werewolf: role.mahou_shoujo{camp:maniac} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.mahou_shoujo.name","storage":"werewolf:"},{"text":"\uF826\uE508","font":"default"}]
execute if data storage werewolf: role.mahou_shoujo{camp:villager} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.mahou_shoujo.name","storage":"werewolf:"},{"text":"\uF826\uE509","font":"default"}]
execute if data storage werewolf: role.mahou_shoujo{camp:third} run tellraw @s [{"text":"\uF822"},{"interpret":true,"nbt":"role.mahou_shoujo.name","storage":"werewolf:"},{"text":"\uF826\uE50A","font":"default"}]

##基本設定
tellraw @s {"text":"\uF010"}
##人数
execute unless data storage werewolf: role.mahou_shoujo{camp:"third"} run \
execute if data storage werewolf: role.mahou_shoujo{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.mahou_shoujo.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/count/add"}}]
execute if data storage werewolf: role.mahou_shoujo{camp:"third"} if data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.mahou_shoujo{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.mahou_shoujo.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/count/add"}}]
execute if data storage werewolf: role.mahou_shoujo{camp:"third"} unless data storage macro: util.role_processing{third_camp:0} run \
execute if data storage werewolf: role.mahou_shoujo{count:0} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.mahou_shoujo.count","storage":"werewolf:","color":"gray"},{"text":" >","color":"red","hoverEvent":{"action":"show_text","contents":[{"text":"第三陣営は複数入れられません"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:asset/sfx/error"}}]
$execute unless data storage werewolf: role.mahou_shoujo{count:0} unless data storage werewolf: role.mahou_shoujo{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/count/remove"}},{"nbt":"role.mahou_shoujo.count","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/count/add"}}]
$execute if data storage werewolf: role.mahou_shoujo{count:$(count_max)} run tellraw @s [{"text":"  最大人数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/count/remove"}},{"nbt":"role.mahou_shoujo.count","storage":"werewolf:","color":"red"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##スキル設定
tellraw @s {"text":"\uF011"}
##魔法弾
#クールタイム
execute if data storage werewolf: role.mahou_shoujo.skill_2{cooltime_second:5} run tellraw @s [{"text":"　[魔法弾] 回復時間: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.mahou_shoujo.skill_2.cooltime_second","storage":"werewolf:","color":"white"},{"text":"秒"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/cooltime/add"}}]
execute unless data storage werewolf: role.mahou_shoujo.skill_2{cooltime_second:5} unless data storage werewolf: role.mahou_shoujo.skill_2{cooltime_second:60} run tellraw @s [{"text":"　[魔法弾] 回復時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/cooltime/remove"}},{"nbt":"role.mahou_shoujo.skill_2.cooltime_second","storage":"werewolf:"},{"text":"秒"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/cooltime/add"}}]
execute if data storage werewolf: role.mahou_shoujo.skill_2{cooltime_second:60} run tellraw @s [{"text":"　[魔法弾] 回復時間: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"時間を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/cooltime/remove"}},{"nbt":"role.mahou_shoujo.skill_2.cooltime_second","storage":"werewolf:","color":"red"},{"text":"秒"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]
#最大回数
execute if data storage werewolf: role.mahou_shoujo.skill_2{limit:1} run tellraw @s [{"text":"　[魔法弾] 最大回数: "},{"text":"< ","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上減らせません"}]}},{"nbt":"role.mahou_shoujo.skill_2.limit","storage":"werewolf:","color":"white"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"回数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/limit/add"}}]
execute unless data storage werewolf: role.mahou_shoujo.skill_2{limit:1} unless data storage werewolf: role.mahou_shoujo.skill_2{limit:999} run tellraw @s [{"text":"　[魔法弾] 最大回数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"人数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/limit/remove"}},{"nbt":"role.mahou_shoujo.skill_2.limit","storage":"werewolf:"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"回数を増やす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/limit/add"}}]
execute if data storage werewolf: role.mahou_shoujo.skill_2{limit:999} run tellraw @s [{"text":"　[魔法弾] 最大回数: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"回数を減らす"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/limit/remove"}},{"text":"∞","color":"white"},{"text":" >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上増やせません"}]}}]

##その他設定
tellraw @s {"text":"\uF012"}
##墓生成
##ダミー選択
execute if data storage werewolf: role.mahou_shoujo{first_dummy:true} run tellraw @s [{"text":"  ダミー役職: "},{"text":"\uF000","clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/first_dummy/off"}}]
execute if data storage werewolf: role.mahou_shoujo{first_dummy:false} run tellraw @s [{"text":"  ダミー役職: "},{"text":"\uF001","clickEvent":{"action":"run_command","value":"/function werewolf:role/mahou_shoujo/settings/skill/first_dummy/on"}}]
tellraw @s {"text":"  ダミー役職選択(ポンコツ系共通)"}
function werewolf:role/mahou_shoujo/settings/skill/dummy_role/

##戻る
tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/role/"}}