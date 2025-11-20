##debug
execute if data storage werewolf: settings{debug:false} run data modify storage werewolf: settings.debug set value true

##各種設定
gamerule sendCommandFeedback true

##設定を更新
function werewolf:settings/.menu/