## 昼から夜に
execute unless data storage werewolf: gamestate.time{id:night} run function werewolf:system/time_change/night

## 夜から昼に
execute if data storage werewolf: gamestate.time{id:night} run function werewolf:system/time_change/day
