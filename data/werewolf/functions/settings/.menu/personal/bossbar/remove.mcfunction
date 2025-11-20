##bossbar_remove
scoreboard players remove @s bossbar_negative 1
#0以下なら1に
execute if score @s bossbar_negative matches ..0 run scoreboard players set @s bossbar_negative 1


##表示更新
function werewolf:settings/.menu/personal/