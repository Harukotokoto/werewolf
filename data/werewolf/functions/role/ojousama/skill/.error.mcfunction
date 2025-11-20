##エラー処理

## sfx
function werewolf:asset/sfx/error

## アナウンス
#初日
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run tellraw @s {"text":"初日の昼はスキルが使えない"}
#使用回数超過
execute as @s[scores={skill_limit_0=0}] run return run tellraw @s {"text":"あなたのワガママはもう聞いてもらえない…"}
#クエスト外
execute unless data storage werewolf: gamestate.quest{active:true} run return run tellraw @s {"text":"今はまだ使えない"}
#クールタイム中
execute as @s[scores={skill_cooltime_0=1..}] run tellraw @s {"text":"今はまだ使えない"}
