##アイテム使用中ならreturn
execute if data storage werewolf: gamestate.item{active:true} run return run tellraw @s {"text":"今は使えない"}

##アイテムを使用中に
data modify storage werewolf: gamestate.item.active set value true

##狼陣営以外を盲目に
effect give @a[tag=player,tag=!camp_wolf] blindness 10 0 true

##アナウンス
execute as @a[tag=camp_wolf] run title @a title [{"text":"\uE003","font":"announce"}]
execute as @a[tag=!camp_wolf] run title @a title [{"text":"\uE004","font":"announce"}]

##アイテム使用者のmainhandをairに
item replace entity @s weapon.mainhand with air

##10秒後に効果を解除
schedule function werewolf:item/blindness_tool/defuse 10s