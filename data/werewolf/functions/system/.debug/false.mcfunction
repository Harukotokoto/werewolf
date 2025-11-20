##debug
execute if data storage werewolf: settings{debug:true} run data modify storage werewolf: settings.debug set value false

##各種設定
gamerule sendCommandFeedback false

##設定を更新
function werewolf:settings/.menu/