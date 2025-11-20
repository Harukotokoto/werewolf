$execute as @e[type=marker,tag=$(field),tag=tp_point] run tag @s add this_tp
$execute as @e[type=marker,tag=$(field),tag=tp_point] run tag @s add no_tp

execute as @a[tag=player,sort=random] run function werewolf:system/set_player/tp

$tag @e[type=marker,tag=$(field),tag=tp_point] remove this_tp
$tag @e[type=marker,tag=$(field),tag=tp_point] remove no_tp