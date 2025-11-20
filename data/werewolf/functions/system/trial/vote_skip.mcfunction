## 投票する
#無効票
execute if score @s can_vote matches 1 run return run tellraw @s "あなたは既に投票している"

#有効票
tellraw @s [{"text":"投票をスキップした"}]
scoreboard players add #GameManager votes 1
scoreboard players set @s can_vote 1
