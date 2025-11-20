##main
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":"\uF002"}
tellraw @s {"text":"\n"}
tellraw @s {"text":" \uF004\uF822      役職人数/スキル/能力等の詳細設定を行います","color":"white","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/role/"}}
tellraw @s {"text":" \uF005    商品の価格設定等を行います","color":"white","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/shop/"}}
tellraw @s {"text":" \uF006    ゲームに関するその他の設定を行います","color":"white","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/others/"}}
tellraw @s {"text":" \uF007\uF822      UIの表示に関する設定を行います","color":"white","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/personal/"}}

#デバッグ用
#tellraw @s {"text":" -----------------------------------------------"}
#execute if data storage werewolf: settings{debug:false} run tellraw @s [{"text":" \uF008 ","color":"white"},{"text":"\uF001","color":"white","clickEvent":{"action":"run_command","value":"/function werewolf:system/.debug/true"}}]
#execute if data storage werewolf: settings{debug:true} run tellraw @s [{"text":" \uF008 ","color":"white"},{"text":"\uF000","color":"white","clickEvent":{"action":"run_command","value":"/function werewolf:system/.debug/false"}}]
##演出
function werewolf:asset/sfx/click