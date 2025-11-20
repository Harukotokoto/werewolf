## シャッフル処理-2

##すり替え前tagを追加
tag @s add not_yet_ie
##自分のhotbar0~6 + offhand を使用禁止インベントリに複製
#hotbar=9~15 offhand=16 cursor=17 crafting=18~21
item replace entity @s inventory.9 from entity @s hotbar.0
item replace entity @s inventory.10 from entity @s hotbar.1
item replace entity @s inventory.11 from entity @s hotbar.2
item replace entity @s inventory.12 from entity @s hotbar.3
item replace entity @s inventory.13 from entity @s hotbar.4
item replace entity @s inventory.14 from entity @s hotbar.5
item replace entity @s inventory.15 from entity @s hotbar.6

item replace entity @s inventory.16 from entity @s weapon.offhand

item replace entity @s inventory.17 from entity @s player.cursor

item replace entity @s inventory.18 from entity @s player.crafting.0
item replace entity @s inventory.19 from entity @s player.crafting.1
item replace entity @s inventory.20 from entity @s player.crafting.2
item replace entity @s inventory.21 from entity @s player.crafting.3