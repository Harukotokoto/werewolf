##エラー処理

## sfx
function werewolf:asset/sfx/error

## アナウンス
#初日
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run tellraw @s {"text":"初日の昼はスキルが使えない"}
#使用回数超過
execute as @s[scores={skill_limit_0=0}] run return run tellraw @s {"text":"このスキルはもう使えない"}
#クールタイム中
execute as @s[scores={skill_cooltime_0=1..}] run return run tellraw @s {"text":"今はまだ使えない"}
#誰かを守護中
execute as @s[team=kishi] unless entity @s[scores={protected_new=0}] run return run tellraw @s [{"text":"あなたは今も"},{"selector":"@a[scores={protected=1}]"},{"text":"を護っている"}]
execute as @s[team=!kishi] unless entity @s[scores={protected_dummy_new=0}] run return run tellraw @s [{"text":"あなたは今も"},{"selector":"@a[scores={protected_dummy=1}]"},{"text":"を護っている"}]
#2連続守護
$execute as @s[team=kishi] if entity @s[scores={protected_old=$(reserve_0)}] run return run tellraw @s {"text":"連続で護ることはできない"}
$execute as @s[team=!kishi] if entity @s[scores={protected_dummy_old=$(reserve_0)}] run tellraw @s {"text":"連続で護ることはできない"}