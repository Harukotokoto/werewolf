## シャッフル処理-3

#自身の交換前tag削除
tag @s remove not_yet_ie

#ランダムに1人選択
execute as @a[tag=player,tag=not_yet_ie,sort=random,limit=1] run tag @s add target_ie
#対象者が居なければreturn
execute unless entity @a[tag=player,tag=target_ie] run return fail

#アイテム置き換え処理
item replace entity @s hotbar.0 from entity @a[tag=player,tag=target_ie,limit=1] inventory.9
item replace entity @s hotbar.1 from entity @a[tag=player,tag=target_ie,limit=1] inventory.10
item replace entity @s hotbar.2 from entity @a[tag=player,tag=target_ie,limit=1] inventory.11
item replace entity @s hotbar.3 from entity @a[tag=player,tag=target_ie,limit=1] inventory.12
item replace entity @s hotbar.4 from entity @a[tag=player,tag=target_ie,limit=1] inventory.13
item replace entity @s hotbar.5 from entity @a[tag=player,tag=target_ie,limit=1] inventory.14
item replace entity @s hotbar.6 from entity @a[tag=player,tag=target_ie,limit=1] inventory.15

item replace entity @s weapon.offhand from entity @a[tag=player,tag=target_ie,limit=1] inventory.16

item replace entity @s player.cursor from entity @a[tag=player,tag=target_ie,limit=1] inventory.17

item replace entity @s player.crafting.0 from entity @a[tag=player,tag=target_ie,limit=1] inventory.18
item replace entity @s player.crafting.1 from entity @a[tag=player,tag=target_ie,limit=1] inventory.19
item replace entity @s player.crafting.2 from entity @a[tag=player,tag=target_ie,limit=1] inventory.20
item replace entity @s player.crafting.3 from entity @a[tag=player,tag=target_ie,limit=1] inventory.21


item replace entity @a[tag=player,tag=target_ie,limit=1] hotbar.0 from entity @s inventory.9
item replace entity @a[tag=player,tag=target_ie,limit=1] hotbar.1 from entity @s inventory.10
item replace entity @a[tag=player,tag=target_ie,limit=1] hotbar.2 from entity @s inventory.11
item replace entity @a[tag=player,tag=target_ie,limit=1] hotbar.3 from entity @s inventory.12
item replace entity @a[tag=player,tag=target_ie,limit=1] hotbar.4 from entity @s inventory.13
item replace entity @a[tag=player,tag=target_ie,limit=1] hotbar.5 from entity @s inventory.14
item replace entity @a[tag=player,tag=target_ie,limit=1] hotbar.6 from entity @s inventory.15

item replace entity @a[tag=player,tag=target_ie,limit=1] weapon.offhand from entity @s inventory.16

item replace entity @a[tag=player,tag=target_ie,limit=1] player.cursor from entity @s inventory.17

item replace entity @a[tag=player,tag=target_ie,limit=1] player.crafting.0 from entity @s inventory.18
item replace entity @a[tag=player,tag=target_ie,limit=1] player.crafting.1 from entity @s inventory.19
item replace entity @a[tag=player,tag=target_ie,limit=1] player.crafting.2 from entity @s inventory.20
item replace entity @a[tag=player,tag=target_ie,limit=1] player.crafting.3 from entity @s inventory.21


#tag削除
tag @a[tag=player,tag=target_ie] remove not_yet_ie
tag @a[tag=player,tag=target_ie] remove target_ie