## テレポート処理-2

#ランダムなプレイヤー位置にtp
tp @s @e[type=marker,tag=teleport_marker,sort=random,limit=1]
#tp地点のマーカーをキル
execute as @s at @s run kill @e[type=marker,tag=teleport_marker,sort=nearest,limit=1]
#演出
execute as @a[tag=player] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 0.5 1 0.0
execute as @a[tag=player] at @s run particle minecraft:witch ~ ~0.8 ~ 0.5 0.5 0.5 5 10 force @a
tellraw @s [{"text":"全員の位置がランダムで入れ替えられた。","color":"red"}]