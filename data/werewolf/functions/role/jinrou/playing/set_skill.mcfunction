## スキル配置

## スキルセット
#slotに入ったアイテムをcursorに返却
item replace entity @s player.cursor from entity @s hotbar.8
#流出したアイテムをclear
clear @s *[minecraft:custom_data~{Tags:["skill"]}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["skill"]}}}}]
#再配置
execute as @s[scores={skill_mode=0}] run loot replace entity @s hotbar.8 loot werewolf:skill/jinrou/0_cooltime
execute as @s[scores={skill_mode=1}] run loot replace entity @s hotbar.8 loot werewolf:skill/jinrou/2_cooltime