##shop
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF014"}
tellraw @s {"text":"\n"}

tellraw @s {"text":"\uF01B"}
#美味しいパン
execute if data storage werewolf: settings.shop.price{bread:0} run tellraw @s [{"text":"  焼きたてのパンx1: "},{"text":"< ","color":"gray"},{"text":"販売しない","color":"red"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を上げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/add {goods:bread,page:0}"}}]
execute unless data storage werewolf: settings.shop.price{bread:0} unless data storage werewolf: settings.shop.price{bread:100} run tellraw @s [{"text":"  焼きたてのパンx1: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を下げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/remove {goods:bread,page:0}"}},{"text":"\uE506"},{"nbt":"settings.shop.price.bread","storage":"werewolf:"},{"text":"\uF822 >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を上げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/add {goods:bread,page:0}"}}]
execute if data storage werewolf: settings.shop.price{bread:100} run tellraw @s [{"text":"  焼きたてのパンx1: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を下げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/remove {goods:bread,page:0}"}},{"text":"\uE506"},{"nbt":"settings.shop.price.bread","storage":"werewolf:","color":"red"},{"text":"\uF822 >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上上げられません"}]}}]
#美味しいパンx5
execute if data storage werewolf: settings.shop.price{breads:0} run tellraw @s [{"text":"  焼きたてのパンx5: "},{"text":"< ","color":"gray"},{"text":"販売しない","color":"red"},{"text":" >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を上げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/add {goods:breads,page:0}"}}]
execute unless data storage werewolf: settings.shop.price{breads:0} unless data storage werewolf: settings.shop.price{breads:100} run tellraw @s [{"text":"  焼きたてのパンx5: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を下げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/remove {goods:breads,page:0}"}},{"text":"\uE506"},{"nbt":"settings.shop.price.breads","storage":"werewolf:"},{"text":"\uF822 >","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を上げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/add {goods:breads,page:0}"}}]
execute if data storage werewolf: settings.shop.price{breads:100} run tellraw @s [{"text":"  焼きたてのパンx5: "},{"text":"< ","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"価格を下げる"}]},"clickEvent":{"action":"run_command","value":"/function werewolf:shop/settings/price/remove {goods:breads,page:0}"}},{"text":"\uE506"},{"nbt":"settings.shop.price.breads","storage":"werewolf:","color":"red"},{"text":"\uF822 >","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"これ以上上げられません"}]}}]

tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/shop/"}}

##演出
function werewolf:asset/sfx/click