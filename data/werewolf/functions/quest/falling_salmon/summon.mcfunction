## summon

$tag @e[type=marker,tag=ground,tag=quest,tag=$(field),sort=random,limit=8] add this

execute as @e[type=marker,tag=ground,tag=quest,tag=this] at @s run summon salmon ~ ~20 ~ {Tags:["quest_salmon","quest"],PersistenceRequired:true,DeathLootTable:"werewolf:death_loot_table/quest/salmon",Health:1f,Air:100000,active_effects:[{id:"minecraft:slow_falling",amplifier:0b,duration:-1,show_particles:0b}]}

execute as @e[type=salmon,tag=quest_salmon] at @s run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

tag @e[type=marker,tag=ground,tag=quest,tag=this] remove this




