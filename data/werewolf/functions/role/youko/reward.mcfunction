##報酬を配布

## 妖狐陣営勝利
execute if data storage werewolf: {winning_camp:"youko_0"} run loot replace entity @a[tag=team_youko,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/fox_mask
execute if data storage werewolf: {winning_camp:"youko_0"} run loot replace entity @a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/fox_mask
execute if data storage werewolf: {winning_camp:"youko_1"} run loot replace entity @a[tag=team_youko,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/fox_mask
execute if data storage werewolf: {winning_camp:"youko_1"} run loot replace entity @a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/fox_mask