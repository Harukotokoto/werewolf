##報酬を配布

## キューピット陣営勝利
execute if data storage werewolf: {winning_camp:"cupid_0"} run loot replace entity @a[tag=team_cupid,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/cupid_hairpin
execute if data storage werewolf: {winning_camp:"cupid_0"} run loot replace entity @a[tag=lovers,scores={ID=1..}] armor.head loot werewolf:item/hat/cupid_hairpin
execute if data storage werewolf: {winning_camp:"cupid_1"} run loot replace entity @a[tag=team_cupid,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/cupid_hairpin
execute if data storage werewolf: {winning_camp:"cupid_1"} run loot replace entity @a[tag=lovers,scores={ID=1..}] armor.head loot werewolf:item/hat/cupid_hairpin
