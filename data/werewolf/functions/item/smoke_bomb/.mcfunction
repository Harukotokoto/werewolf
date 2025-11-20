execute as @a[predicate=werewolf:flag/is_sneaking] if items entity @s weapon.mainhand minecraft:snowball[minecraft:custom_data~{Tags:["smoke_bomb"]}] unless items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["charged"]}] run item modify entity @s weapon.mainhand werewolf:set_custom_data/smoke_bomb/charged
execute as @a[predicate=!werewolf:flag/is_sneaking] if items entity @s weapon.mainhand minecraft:snowball[minecraft:custom_data~{Tags:["smoke_bomb"]}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["charged"]}] run item modify entity @s weapon.mainhand werewolf:set_custom_data/smoke_bomb/

execute as @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{Tags:["smoke_bomb"]}}}}] at @s run function werewolf:item/smoke_bomb/summon
execute as @e[type=item,tag=smoke_bomb] at @s run function werewolf:item/smoke_bomb/bounce
execute as @e[type=item,tag=smoke_bomb] at @s run function werewolf:item/smoke_bomb/explosion