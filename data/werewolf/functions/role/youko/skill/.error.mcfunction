##エラー処理

## sfx
function werewolf:asset/sfx/error

## アナウンス
#使用回数超過
execute as @s[scores={skill_limit_0=0}] run return run tellraw @s {"text":"このスキルはもう使えない"}
#クールタイム中
execute as @s[scores={skill_cooltime_0=1..}] run return run tellraw @s {"text":"今はまだ使えない"}
#初日
execute if data storage werewolf: gamestate.time{id:"first_day"} run tellraw @s {"text":"初日の昼以降はスキルが使えない"}