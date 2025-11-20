## summon

#boss
$tag @e[type=marker,tag=ground,tag=quest,tag=$(field),sort=random,limit=1] add this_boss
execute at @e[type=marker,tag=ground,tag=quest,tag=this_boss] run summon axolotl ~ ~1 ~ {Invulnerable:true,Tags:["quest_axolotl","boss","quest"],PersistenceRequired:true,Variant:4}
execute as @e[type=marker,tag=ground,tag=quest,tag=this_boss] at @s run summon interaction ~ ~ ~ {Tags:["quest_axolotl","boss","quest"],width:1f,height:0.7f}

#normal
$tag @e[type=marker,tag=ground,tag=quest,tag=$(field),tag=!this_boss,sort=random,limit=7] add this
execute as @e[type=marker,tag=ground,tag=quest,tag=this] at @s run summon axolotl ~ ~1 ~ {Invulnerable:true,Tags:["quest_axolotl","normal","quest"],PersistenceRequired:true,Variant:5}

execute as @e[type=axolotl,tag=quest_axolotl,tag=quest] at @s run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

execute as @e[type=marker,tag=ground,tag=quest,tag=this_boss] run tag @s remove this_boss
execute as @e[type=marker,tag=ground,tag=quest,tag=this] run tag @s remove this