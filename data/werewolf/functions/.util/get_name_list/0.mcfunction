## ID取得用player_headを召喚
loot spawn ~ 1000 ~ loot werewolf:get_name

## ID取得(macro: reserve_0)
execute at @s positioned ~ 1000 ~ run data modify storage werewolf: player_list append from entity @e[type=item,y=1000,nbt={Item:{id:"minecraft:player_head"}},distance=..0.05,limit=1] Item.components."minecraft:profile".name

## player_headをキル
execute at @s positioned ~ 1000 ~ run kill @e[type=item,y=1000,nbt={Item:{id:"minecraft:player_head"}},distance=..0.05,limit=1]