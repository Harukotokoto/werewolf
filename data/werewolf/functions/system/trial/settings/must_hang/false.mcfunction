##must_hang

execute if data storage werewolf: settings.trial{must_hang:true} run data modify storage werewolf: settings.trial.must_hang set value false

##暫定で[裁判官]設定に表示
function werewolf:role/saibankan/settings/ with storage werewolf: role.saibankan