summon item ~ ~ ~ {Item:{id:"minecraft:snowball",components:{"minecraft:custom_model_data":2}},Health:1s,PickupDelay:10000,Tags:["smoke_bomb","not_yet"]}
data modify entity @e[type=item,tag=smoke_bomb,sort=nearest,limit=1] Motion set from entity @s Motion
damage @e[type=item,limit=1,sort=nearest,tag=smoke_bomb,tag=not_yet] 0.0

execute as @s[nbt=!{Item:{components:{"minecraft:custom_data":{Tags:["charged"]}}}}] as @e[type=item,limit=1,sort=nearest,tag=smoke_bomb,tag=not_yet] run scoreboard players set @s reserve_0 15
execute as @s[nbt={Item:{components:{"minecraft:custom_data":{Tags:["charged"]}}}}] as @e[type=item,limit=1,sort=nearest,tag=smoke_bomb,tag=not_yet] run scoreboard players set @s reserve_0 45

tag @e[type=item,limit=1,sort=nearest,tag=smoke_bomb,tag=not_yet] remove not_yet
kill @s