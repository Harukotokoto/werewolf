kill @e[type=!marker,tag=ice_sword]
loot give @s loot werewolf:item/quest/ice_sword

execute as @s at @s run playsound minecraft:pickup_sword master @a

advancement revoke @s only werewolf:interacted_with_entity/quest/ice_sword