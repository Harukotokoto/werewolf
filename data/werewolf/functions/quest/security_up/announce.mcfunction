## announce
#アナウンス
tellraw @a {"text":"[システム] 死亡者が発生しました","color":"dark_red"}
execute as @a at @s run playsound minecraft:warning master @s

#おかたづけ
kill @s