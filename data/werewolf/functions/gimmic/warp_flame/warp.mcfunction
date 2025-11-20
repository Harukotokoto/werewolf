## warp

scoreboard players set @s is_sneaking 0
execute as @s at @s if entity @e[type=marker,distance=..1,tag=warp_flame_1] run tp @s @e[type=marker,distance=3..200,sort=random,limit=1,tag=warp_flame_1]
execute as @s at @s if entity @e[type=marker,distance=..1,tag=warp_flame_2] run tp @s @e[type=marker,distance=3..200,sort=random,limit=1,tag=warp_flame_2]
execute as @s at @s if entity @e[type=marker,distance=..1,tag=warp_flame_3] run tp @s @e[type=marker,distance=3..200,sort=random,limit=1,tag=warp_flame_3]
execute as @s at @s if entity @e[type=marker,distance=..1,tag=warp_flame_4] run tp @s @e[type=marker,distance=3..200,sort=random,limit=1,tag=warp_flame_4]
execute as @s at @s if entity @e[type=marker,distance=..1,tag=warp_flame_5] run tp @s @e[type=marker,distance=3..200,sort=random,limit=1,tag=warp_flame_5]

#ベント使用後に空腹
effect give @s minecraft:hunger 10 30 true