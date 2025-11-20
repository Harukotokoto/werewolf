## summon

#wolf
$tag @e[type=marker,tag=ground,tag=quest,tag=$(field),sort=random,limit=1] add this


execute store result score #GameManager reserve_0 run random value 0..8

execute if score #GameManager reserve_0 matches 0 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"pale"}
execute if score #GameManager reserve_0 matches 1 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"woods"}
execute if score #GameManager reserve_0 matches 2 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"ashen"}
execute if score #GameManager reserve_0 matches 3 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"black"}
execute if score #GameManager reserve_0 matches 4 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"chestnut"}
execute if score #GameManager reserve_0 matches 5 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"rusty"}
execute if score #GameManager reserve_0 matches 6 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"spotted"}
execute if score #GameManager reserve_0 matches 7 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"striped"}
execute if score #GameManager reserve_0 matches 8 at @e[type=marker,tag=ground,tag=quest,tag=this] run summon wolf ~ ~1 ~ {Invulnerable:true,Age:-32768,Tags:["quest_wolf","wimw","quest"],PersistenceRequired:true,Attributes:[{Name:generic.attack_damage,Base:0}],variant:"snowy"}

execute as @e[type=marker,tag=ground,tag=quest,tag=this] run tag @s remove this

execute as @e[type=wolf,tag=quest_wolf,tag=wimw,tag=quest] at @s run summon interaction ~ ~ ~ {Tags:["quest_wolf","quest"],width:0.7f,height:0.7f}

execute at @e[type=wolf,tag=quest_wolf,tag=wimw,tag=quest] run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a


#owner
$execute at @e[type=marker,tag=delivery_box,tag=$(field)] align xyz run summon villager ~0.5 ~-1000 ~0.5 {Invulnerable:true,PersistenceRequired:true,Tags:["wolf_owner","quest"],Glowing:true,NoAI:true,CustomNameVisible:1b,CustomName:'{"text":"飼い主","font":"custom_name"}'}
$execute as @e[type=villager,tag=wolf_owner] run data modify entity @s Rotation set from entity @e[type=marker,tag=delivery_box,tag=$(field),sort=nearest,limit=1] Rotation
$execute as @e[type=marker,tag=delivery_box,tag=$(field)] at @s align xyz run tp @e[type=villager,tag=wolf_owner,sort=nearest,limit=1] ~0.5 ~ ~0.5