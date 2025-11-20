##delete_grave
execute if data storage werewolf: settings.trial{delete_grave:true} run data modify storage werewolf: settings.trial.delete_grave set value false

##暫定で[裁判官]設定に表示
function werewolf:role/saibankan/settings/ with storage werewolf: role.saibankan