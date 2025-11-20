##エラー処理

## sfx
function werewolf:asset/sfx/error

## 成功判定
#初日
execute if data storage werewolf: gamestate.time{id:"first_day"} run return run tellraw @s {"text":"初日の昼はスキルが使えない"}
#使用回数超過
execute as @s[scores={skill_limit_2=0}] run return run tellraw @s {"text":"このスキルはもう使えない"}
#クールタイム中
execute as @s[scores={skill_cooltime_2=1..}] run return run tellraw @s {"text":"今はまだ使えない"}
#罠設置数が上限
execute as @s[team=wanashi] if score #GameManager reserve_0 >= #GameManager reserve_2 run return run tellraw @s [{"text":"罠はこれ以上設置できない (現在の設置数:"},{"score":{"name":"#GameManager","objective":"reserve_0"}},{"text":"個、同時設置可能数:"},{"nbt":"role.wanashi.skill_2.count","storage":"werewolf:"},{"text":"個)"}]
execute as @s[team=!wanashi] if score #GameManager reserve_1 >= #GameManager reserve_2 run return run tellraw @s [{"text":"罠はこれ以上設置できない (現在の設置数:"},{"score":{"name":"#GameManager","objective":"reserve_1"}},{"text":"個、同時設置可能数:"},{"nbt":"role.wanashi.skill_2.count","storage":"werewolf:"},{"text":"個)"}]
#空中
execute if data entity @s {OnGround:0b} run return run tellraw @s {"text":"空中では罠を設置できない"}
#罠にかかっている途中
execute as @s[scores={fall_into_a_pitfall=1..}] run tellraw @s {"text":"罠にかかっているため今は使えない"}