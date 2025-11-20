##death_place_fixed
execute if data storage werewolf: settings.gamemode{death_place_fixed:true} run data modify storage werewolf: settings.gamemode.death_place_fixed set value false

##表示更新
function werewolf:settings/.menu/others/