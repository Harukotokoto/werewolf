##role
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
#tellraw @s {"text":"[役職設定] ※画面右側には15役職以上表示されません。"}
tellraw @s {"text":"\uF013"}
tellraw @s {"text":"\n"}
function werewolf:.util/role_processing/settings/
tellraw @s {"text":"\uF003","clickEvent":{"action":"run_command","value":"/function werewolf:settings/.menu/"}}

##演出
function werewolf:asset/sfx/click