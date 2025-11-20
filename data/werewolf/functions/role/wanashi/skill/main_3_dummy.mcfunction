## 罠にかかった場合の処理

#罠の位置にtp用マーカー設置
execute at @e[type=snowball,tag=pitfall_dummy,tag=!inactive,limit=1,sort=nearest] positioned ~ ~-1 ~ run summon marker ~ ~ ~ {Tags:["pitfall_tp"]}
data modify entity @e[type=marker,tag=pitfall_tp,limit=1,sort=nearest] Rotation[0] set from entity @s Rotation[0]

#罠に落ちた時のtp用判定
scoreboard players set @s fall_into_a_pitfall 100

#落とし穴アニメーションを召喚
execute at @e[type=snowball,tag=pitfall_dummy,tag=!inactive,limit=1,sort=nearest] run function animated_java:pitfall/summon
execute at @e[type=snowball,tag=pitfall_dummy,tag=!inactive,limit=1,sort=nearest] as @e[type=#animated_java:root,tag=aj.pitfall.root,limit=1,sort=nearest] run function animated_java:pitfall/animations/genarate/play
data modify entity @e[type=#animated_java:root,tag=aj.pitfall.root,limit=1,sort=nearest] Rotation[1] set value 0f

#演出
execute at @e[type=snowball,tag=pitfall_dummy,tag=!inactive,limit=1,sort=nearest] run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
execute at @e[type=snowball,tag=pitfall_dummy,tag=!inactive,limit=1,sort=nearest] run particle minecraft:explosion ~ ~ ~
execute at @e[type=snowball,tag=pitfall_dummy,tag=!inactive,limit=1,sort=nearest] run playsound minecraft:fall_in_a_hole master @a[distance=..5]

#最も近くにある罠を削除
kill @e[type=snowball,tag=pitfall_dummy,tag=!inactive,limit=1,sort=nearest]

#自身にデバフ
tellraw @s "あなたは落とし穴に落ちてしまった…!"
effect give @s jump_boost 5 250 true
effect give @s slowness 5 127 true
effect give @s blindness 5 255 true
effect give @s darkness 5 255 true