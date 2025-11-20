## テレポート処理-2

#ランダムなプレイヤー位置にtp
tp @s @e[type=marker,tag=teleport_marker,sort=random,limit=1]
#tp地点のマーカーをキル
execute as @s at @s run kill @e[type=marker,tag=teleport_marker,sort=nearest,limit=1]