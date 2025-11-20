## 報酬配布処理
loot replace entity @s player.crafting.0 loot werewolf:item/quest/ice_sword
execute as @s at @s run playsound minecraft:pickup_sword master @s
#give @s emerald 10
tellraw @s {"text":"メロスは間に合った。(インベントリの報酬枠にアイテムが配布されました。)","color":"green"}