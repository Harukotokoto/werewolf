## summon

$tag @e[type=marker,tag=sky,tag=quest,tag=$(field),sort=random,limit=8] add this

execute as @e[type=marker,tag=sky,tag=quest,tag=this] at @s run summon minecraft:phantom ~ ~ ~ {Tags:["target","quest"],PersistenceRequired:true,ArmorItems:[{id:stone,components:{enchantments:{levels:{fire_protection:7}}}}],ArmorDropChances:[0f,0f,0f,0f],DeathLootTable:"",Health:1f}

execute at @e[type=marker,tag=sky,tag=quest,tag=this] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

$tag @e[type=marker,tag=sky,tag=quest,tag=$(field)] remove this