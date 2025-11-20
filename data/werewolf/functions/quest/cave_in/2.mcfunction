## 落盤処理-2
function animated_java:cave_in/summon

summon slime ^0.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
summon slime ^0.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
summon slime ^1.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
summon slime ^1.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
summon slime ^-0.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
summon slime ^-0.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
summon slime ^-1.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
summon slime ^-1.5 ^-1000 ^ {Tags:["closure"],NoGravity:1b,Silent:1b,Invulnerable:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,Size:0,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b,ambient:0b}],Attributes:[{Name:generic.scale,Base:4}]}
execute positioned ~ ~-1000 ~ as @e[type=slime,distance=..5,tag=closure] at @s run tp ~ ~1000 ~

execute as @e[type=#animated_java:root,tag=aj.cave_in.root,limit=1,sort=nearest] run function animated_java:cave_in/animations/anim_0/play