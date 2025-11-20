## テレポート処理-1

#tp地点を設定
execute as @a[tag=player] at @s run summon marker ^ ^ ^ {Tags:["teleport_marker","quest"]}
execute as @a[tag=player] at @s run tp @e[type=marker,tag=teleport_marker,sort=nearest,limit=1] @s
#各々tp
execute as @a[tag=player,sort=random] run function werewolf:role/shuffler/skill/shuffle/main_3