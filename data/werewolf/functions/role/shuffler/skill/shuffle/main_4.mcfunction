## ダミーテレポート処理

#テレポート時の動作ラグを再現
execute as @s at @s run summon marker ^ ^ ^ {Tags:["dummy_teleport_marker","quest"]}
execute as @s at @s run tp @e[type=marker,tag=dummy_teleport_marker,sort=nearest,limit=1] @s
tp @s @e[type=marker,tag=dummy_teleport_marker,sort=nearest,limit=1]
kill @e[type=marker,tag=dummy_teleport_marker]

#演出
tellraw @s [{"text":"全員の位置がランダムで入れ替えられた。","color":"red"}]
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 0.5 1 0.0
tag @s add its_me
execute as @a[tag=player] at @s run particle minecraft:witch ~ ~0.8 ~ 0.5 0.5 0.5 5 10 force @a[tag=its_me]
tag @s remove its_me
