##shop
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF014"}
tellraw @s {"text":"\n"}

tellraw @s {"text":"\uF01A"}
tellraw @s [{"text":"  [食料系]","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/shop/shop_0"}}]
tellraw @s [{"text":"  [武器/ツール系]","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/shop/shop_1"}}]
tellraw @s [{"text":"  [特殊アイテム系]","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/shop/shop_2"}}]
tellraw @s [{"text":"  [ポーション系]","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/shop/shop_3"}}]


tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/"}}

##演出
function werewolf:asset/sfx/click