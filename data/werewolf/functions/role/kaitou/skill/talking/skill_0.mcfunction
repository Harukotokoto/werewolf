##語り

tellraw @s {"text":"[***]ほーん これはなかなか ええなぁ","font":"talk"}

#演出
execute at @s run playsound minecraft:talk_0 master @s

#連続防止
scoreboard players set @s talk_kaitou 0