#死亡者が居なくなるまで再帰処理

#死亡処理
execute as @a[scores={death=1..}] at @s run function werewolf:system/death/
#再帰処理
execute if entity @a[scores={death=1..}] run function werewolf:system/death/search