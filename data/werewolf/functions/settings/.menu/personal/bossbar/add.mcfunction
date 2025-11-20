##bossbar_add
scoreboard players add @s bossbar_negative 1
#10以上なら9に
execute if score @s bossbar_negative matches 10.. run scoreboard players set @s bossbar_negative 9

##表示更新
function werewolf:settings/.menu/personal/