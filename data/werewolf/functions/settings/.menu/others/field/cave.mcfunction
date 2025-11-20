#storage
execute unless data storage werewolf: settings{field:"cave"} run data modify storage werewolf: settings.field set value "cave"
#forceload
forceload remove all
forceload add -593 19
#setspawn
setworldspawn -593 17 19
spawnpoint @a -591 37 11

##表示更新
function werewolf:settings/.menu/others/