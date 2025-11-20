$execute as @e[type=marker,tag=$(field),tag=door] at @s run setblock ~ ~ ~ redstone_torch replace
$execute as @e[type=marker,tag=$(field),tag=door] at @s run setblock ~ ~ ~ air replace
stopsound @a