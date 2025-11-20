execute as @s[tag=player,tag=!no_stone_slab] run tellraw @a[tag=check_stone] [{"selector":"@s","color":"white"},{"text":" 生存","color":"green"}]
execute as @s[tag=player,tag=no_stone_slab] run tellraw @a[tag=check_stone] [{"selector":"@s","color":"white"},{"text":" 死亡","color":"red"}]
execute as @s[team=_heaven] run tellraw @a[tag=check_stone] [{"selector":"@s","color":"white"},{"text":" 死亡","color":"red"}]


