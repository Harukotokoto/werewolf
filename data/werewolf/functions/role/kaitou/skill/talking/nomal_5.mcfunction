##語り

tellraw @s [{"text":"[***]いちど ","font":"talk"},{"text":"/kill @a","font":"talk","obfuscated":true,"color":"dark_red"},{"text":" をためしたら？","font":"talk"}]
tellraw @s {"text":"     あれ…いわれへんね","font":"talk"}

#演出
execute at @s run playsound minecraft:talk_0 master @s

#連続防止
scoreboard players set @s talk_kaitou 0