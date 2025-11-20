##語り

tellraw @s {"text":"[***]ちょっと そこの しょうにん","font":"talk"}
tellraw @s {"text":"     このまえ とばくで まけたらしいで?","font":"talk"}
tellraw @s {"text":"     イカサマされた みたいで かわいそうになぁ","font":"talk"}

#演出
execute at @s run playsound minecraft:talk_0 master @s

#連続防止
scoreboard players set @s talk_kaitou 0