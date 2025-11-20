execute as @a[predicate=werewolf:flag/is_sneaking] if items entity @s weapon.mainhand minecraft:snowball[minecraft:custom_data~{Tags:["tnt_bomb"]}] unless items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["charged"]}] run item modify entity @s weapon.mainhand werewolf:set_custom_data/tnt_bomb/charged
execute as @a[predicate=!werewolf:flag/is_sneaking] if items entity @s weapon.mainhand minecraft:snowball[minecraft:custom_data~{Tags:["tnt_bomb"]}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["charged"]}] run item modify entity @s weapon.mainhand werewolf:set_custom_data/tnt_bomb/

execute as @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{Tags:["tnt_bomb"]}}}}] at @s run function werewolf:item/tnt_bomb/summon
execute as @e[type=item,tag=tnt_bomb] at @s run function werewolf:item/tnt_bomb/bounce
execute as @e[type=item,tag=tnt_bomb] at @s run function werewolf:item/tnt_bomb/explosion