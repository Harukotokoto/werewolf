
## 狼陣営勝利
execute if data storage werewolf: {winning_camp:"wolf_0"} run loot replace entity @a[tag=camp_wolf,scores={ID=1..}] armor.head loot werewolf:item/hat/wolf_mask
execute if data storage werewolf: {winning_camp:"wolf_0"} run loot replace entity @a[tag=camp_maniac,scores={ID=1..}] armor.head loot werewolf:item/hat/wolf_mask

## 村陣営勝利
execute if data storage werewolf: {winning_camp:"villager_0"} run loot replace entity @a[tag=camp_villager,scores={ID=1..}] armor.head loot werewolf:item/hat/villager_hat

##実行
function werewolf:.util/role_processing/reward/0 with storage macro: util.role_processing