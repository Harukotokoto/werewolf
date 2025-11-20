## ダミー

## 罠の作成
#罠を設置する
summon snowball ~ ~ ~ {Item:{id:"minecraft:snowball",components:{"minecraft:fire_resistant":{},"minecraft:custom_model_data":1}},Tags:["pitfall_dummy","inactive","not_yet"],NoGravity:true}
#投擲者を記録
data modify entity @e[type=snowball,tag=pitfall_dummy,tag=not_yet,sort=nearest,limit=1] Owner set from entity @s UUID
#設置完了
tag @e[type=snowball,tag=pitfall_dummy,tag=not_yet,sort=nearest,limit=1] remove not_yet

#演出
playsound minecraft:set_pitfall master @s
#アナウンス
scoreboard players set #GameManager reserve_1 0
execute at @s run summon marker ~ ~ ~ {Tags:[pitfall_dummy_counter]}
execute as @e[type=snowball,tag=pitfall_dummy] on origin at @s as @e[type=marker,tag=pitfall_dummy_counter,distance=..0.01] run scoreboard players add #GameManager reserve_1 1
kill @e[type=marker,tag=pitfall_dummy_counter]
tellraw @s [{"text":"罠を設置した (現在の設置数:"},{"score":{"name":"#GameManager","objective":"reserve_1"}},{"text":"個、同時設置可能数:"},{"nbt":"role.wanashi.skill_2.count","storage":"werewolf:"},{"text":"個)"}]