## penalty
$tag @e[type=marker,tag=ground,tag=quest,tag=$(field),sort=random,limit=15] add this

execute as @e[type=marker,tag=ground,tag=quest,tag=this] at @s run function werewolf:quest/hit_the_target/penalty_1

execute at @e[type=marker,tag=ground,tag=quest,tag=this] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

execute as @e[type=marker,tag=ground,tag=quest,tag=this] run tag @s remove this