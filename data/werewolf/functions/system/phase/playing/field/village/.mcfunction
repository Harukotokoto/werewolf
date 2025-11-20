#リスポーンの上書き防止
execute as @a run spawnpoint @a -0 41 -128
#地下にいるプレイヤーは発光
execute as @a[predicate=werewolf:location_check/y..-11,tag=player] run effect give @s glowing 1 0 true