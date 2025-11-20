##語り

tellraw @s {"text":"[***]きょうは あんたかいな","font":"talk"}
tellraw @s {"text":"     よろしゅうね","font":"talk"}

#演出
execute at @s run playsound minecraft:talk_0 master @s

#連続防止
scoreboard players set @s talk_kaitou 0