##IDを保存
execute store result storage macro: reserve_0 int 1 run scoreboard players get @s ID
##bossbar作成
function werewolf:system/bossbar/.ini/everyone/1 with storage macro: