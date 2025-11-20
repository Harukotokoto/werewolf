##報酬
execute store result score #GameManager reserve_0 run random value 0..99
execute on target if score #GameManager reserve_0 matches 0.. run give @s emerald 1
execute on target if score #GameManager reserve_0 matches 76.. run give @s emerald 1
execute on target if score #GameManager reserve_0 matches 95.. run give @s emerald 1

##消滅処理
execute at @s as @e[type=#animated_java:root,tag=aj.treasure_chest.root,sort=nearest,limit=1] run function animated_java:treasure_chest/animations/open/play
kill @s