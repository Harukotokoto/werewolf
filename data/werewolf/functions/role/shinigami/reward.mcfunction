##報酬を配布

## 死神陣営勝利
execute if data storage werewolf: {winning_camp:"shinigami_0"} run loot replace entity @a[tag=team_shinigami,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/shinigami_hat