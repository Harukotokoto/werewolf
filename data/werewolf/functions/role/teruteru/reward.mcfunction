##報酬を配布

## てるてる陣営勝利
execute if data storage werewolf: {winning_camp:"teruteru_0"} run loot replace entity @a[tag=team_teruteru,tag=!dummy_role,tag=!role_lost,scores={ID=1..}] armor.head loot werewolf:item/hat/teruteru_hat