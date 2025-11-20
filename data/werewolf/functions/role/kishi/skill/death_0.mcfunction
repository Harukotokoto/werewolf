##スキル処理
execute if entity @s[tag=!protected,tag=!protected_dummy] run return fail

#死亡時に騎士の護りフェイズを進行
execute store result storage macro: reserve_0 int 1 run scoreboard players get @s ID
function werewolf:role/kishi/skill/death_1 with storage macro:
