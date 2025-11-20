##アイテムの使用中を解除
data modify storage werewolf: gamestate.item.active set value false

##防具の防御力を戻す
execute as @a run attribute @s minecraft:generic.armor base set 0

##防具解除
clear @a *[minecraft:custom_data~{Tags:["same_look_armor"]}]

##アナウンス
execute as @a run title @a title [{"text":"\uE002","font":"announce"}]