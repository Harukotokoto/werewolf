execute on attacker run loot give @s loot werewolf:item/quest/fresh_apple

##演出
execute as @s at @s run playsound minecraft:block.flowering_azalea.break master @a

##消滅処理
kill @e[type=item_display,tag=delivery_apple,tag=fruit,distance=..0.5,limit=1,sort=nearest]
kill @s