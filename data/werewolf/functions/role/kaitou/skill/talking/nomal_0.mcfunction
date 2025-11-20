##語り

tellraw @s {"text":"[***]もっと たのしんだら？","font":"talk"}
tellraw @s {"text":"     ゲームなんやし","font":"talk"}

#演出
execute at @s run playsound minecraft:talk_0 master @s

#連続防止
scoreboard players set @s talk_kaitou 0