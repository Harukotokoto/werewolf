#リスポーンの上書き防止
execute as @a run spawnpoint @a -591 37 11
#クリスタルの演出
execute if data storage werewolf: gamestate.time{id:night} as @e[tag=crystal_pillar] at @s facing entity @e[tag=crystal_core] eyes run function werewolf:system/phase/playing/field/cave/crystal_particle
execute if data storage werewolf: gamestate.time{id:night} positioned -593 22 30 run particle minecraft:ominous_spawning ~ ~ ~ 4 4 4 0 5 force @a
#夜のデバフ処理
execute if data storage werewolf: gamestate.time{id:night} as @a[tag=player] at @s if entity @e[tag=crystal_debuff,distance=..5] run effect give @s minecraft:hunger 1 2 true
#execute if data storage werewolf: gamestate.time{id:night} as @a[tag=player] at @s if entity @e[tag=crystal_debuff,distance=..5] positioned ~ ~1.2 ~ facing entity @e[tag=crystal_core] eyes run function werewolf:system/phase/playing/field/cave/debuff_particle