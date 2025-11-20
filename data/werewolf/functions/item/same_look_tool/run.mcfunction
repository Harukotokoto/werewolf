##アイテム使用中ならreturn
execute if data storage werewolf: gamestate.item{active:true} run return run tellraw @s {"text":"今は使えない"}

##アイテムを使用中に
data modify storage werewolf: gamestate.item.active set value true

##防具の防御力を皆無に
execute as @a[tag=player] run attribute @s minecraft:generic.armor base set -100

##透け防止の透明化
execute as @a[tag=player] run effect give @s invisibility 30 0 true

##防具装着
execute as @a[tag=player] run loot replace entity @s armor.head loot werewolf:item/same_look_armor/helmet
execute as @a[tag=player] run loot replace entity @s armor.chest loot werewolf:item/same_look_armor/chestplate
execute as @a[tag=player] run loot replace entity @s armor.legs loot werewolf:item/same_look_armor/leggings
execute as @a[tag=player] run loot replace entity @s armor.feet loot werewolf:item/same_look_armor/boots

##アナウンス
execute as @a run title @a title [{"text":"\uE001","font":"announce"}]

##アイテム使用者のmainhandをairに
item replace entity @s weapon.mainhand with air

##30秒後に防具を外す
schedule function werewolf:item/same_look_tool/defuse 30s

