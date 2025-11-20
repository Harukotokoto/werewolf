#storage
execute unless data storage werewolf: settings{field:"village"} run data modify storage werewolf: settings.field set value "village"
#forceload
forceload remove all
forceload add -23 -128
#setspawn
setworldspawn -23 -2 -128
spawnpoint @a -0 41 -128

##表示更新
function werewolf:settings/.menu/others/