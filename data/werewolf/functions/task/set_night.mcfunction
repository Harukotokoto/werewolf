##フィールドごとに分岐
#village
execute if data storage werewolf: settings{field:"village"} run function werewolf:task/field/village/set/.night
#cave
execute if data storage werewolf: settings{field:"cave"} run function werewolf:task/field/cave/set/.night