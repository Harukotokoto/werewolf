##フィールドごとの処理
#village
execute if data storage werewolf: settings{field:"village"} run function werewolf:task/field/village/reward/.common
#cave
execute if data storage werewolf: settings{field:"cave"} run function werewolf:task/field/cave/reward/.common