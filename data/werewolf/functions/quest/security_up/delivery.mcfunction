#納品
execute as @s[nbt=!{Inventory:[{id:"minecraft:emerald"}]}] run tellraw @s {"text":"納品するものを持っていない"}
execute as @s[nbt={Inventory:[{id:"minecraft:emerald"}]}] store result storage werewolf: gamestate.quest.count int 0.99999999 run data get storage werewolf: gamestate.quest.count
execute as @s[nbt={Inventory:[{id:"minecraft:emerald"}]}] run clear @s emerald 1

advancement revoke @s only werewolf:interacted_with_entity/quest/security_up