##settings

##reset
data remove storage werewolf: settings.text

##add
#ver
data modify storage werewolf: settings.text append value '[{"text":"Settings ("},{"nbt":"version","storage":"werewolf:"},{"text":")"}]'
#debug
execute if data storage werewolf: settings{debug:true} run data modify storage werewolf: settings.text append value '{"text":"　-デバッグモード-","color":"red"}'
#time
data modify storage werewolf: settings.text append value '{"text":"　#ゲーム時間"}'
data modify storage werewolf: settings.text append value '[{"text":"　　初日の昼: "},{"nbt":"settings.time.first_day.second","storage":"werewolf:"},{"text":"秒"}]'
data modify storage werewolf: settings.text append value '[{"text":"　　昼: "},{"nbt":"settings.time.day.second","storage":"werewolf:"},{"text":"秒"}]'
data modify storage werewolf: settings.text append value '[{"text":"　　夜: "},{"nbt":"settings.time.night.second","storage":"werewolf:"},{"text":"秒"}]'
#field
execute if data storage werewolf: settings{field:"village"} run data modify storage werewolf: settings.text append value '[{"text":"　#フィールド: "},{"text":"集落","color":"white"}]'
execute if data storage werewolf: settings{field:"cave"} run data modify storage werewolf: settings.text append value '[{"text":"　#フィールド: "},{"text":"炭鉱","color":"white"}]'
#quest
execute if data storage werewolf: settings.gamemode{quest:true} run data modify storage werewolf: settings.text append value '[{"text":"　#ランダムクエスト: "},{"text":"有効","color":"green"}]'
execute if data storage werewolf: settings.gamemode{quest:false} run data modify storage werewolf: settings.text append value '[{"text":"　#ランダムクエスト: "},{"text":"無効","color":"red"}]'
#role_count_limit
execute if data storage werewolf: settings.gamemode{role_count_limit:0} run data modify storage werewolf: settings.text append value '[{"text":"　#人狼役職の人数固定: "},{"text":"無効","color":"red"}]'
execute unless data storage werewolf: settings.gamemode{role_count_limit:0} run data modify storage werewolf: settings.text append value '[{"text":"　#人狼役職の人数固定: "},{"nbt":"settings.gamemode.role_count_limit","storage":"werewolf:"},{"text":"人"}]'
#death_place_fixed
#execute if data storage werewolf: settings.gamemode{death_place_fixed:true} run data modify storage werewolf: settings.text append value '[{"text":"　#死亡場所にプレイヤーを固定: "},{"text":"有効","color":"green"}]'
#execute if data storage werewolf: settings.gamemode{death_place_fixed:false} run data modify storage werewolf: settings.text append value '[{"text":"　#死亡場所にプレイヤーを固定: "},{"text":"無効","color":"red"}]'

#role
data modify storage werewolf: settings.text append value '{"text":"　#役職設定"}'
function werewolf:settings/reload_ui/0 with storage macro: util.role_processing