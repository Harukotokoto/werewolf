## 投票する
#無効票
execute if score @s can_vote matches 1 run return run tellraw @s "あなたは既に投票している"

#有効票
$tellraw @s [{"selector":"@a[scores={ID=$(ID)}]"},{"text":" に投票した"}]
$scoreboard players add @a[scores={ID=$(ID)}] votes 1
scoreboard players set @s can_vote 1
