##発光
execute as @a[tag=player] run effect give @s glowing 10 0 true

##アナウンス
execute as @a run title @a title [{"text":"\uE006","font":"announce"}]

##アイテム使用者のmainhandをairに
item replace entity @s weapon.mainhand with air