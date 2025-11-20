## 落盤処理-1

#落盤地点を抽選
$execute as @e[type=marker,tag=cave_in,tag=$(field),sort=random,limit=1] run tag @s add this
#召喚
execute at @e[type=marker,tag=cave_in,tag=this] run function werewolf:quest/cave_in/2
#演出
execute at @e[type=marker,tag=cave_in,tag=this] run playsound minecraft:cave_in_1 master @a
#おかたづけ
execute as @e[type=marker,tag=cave_in,tag=this] run tag @s remove this