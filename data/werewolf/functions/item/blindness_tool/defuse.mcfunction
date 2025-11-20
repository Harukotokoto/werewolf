##アイテムの使用中を解除
data modify storage werewolf: gamestate.item.active set value false

##アナウンス
execute as @a run title @a title [{"text":"\uE005","font":"announce"}]