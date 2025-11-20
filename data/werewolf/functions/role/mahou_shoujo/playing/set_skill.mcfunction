## スキル配置

## スキルセット
#slotに入ったアイテムをcursorに返却
item replace entity @s player.cursor from entity @s hotbar.8
#流出したアイテムをclear
clear @s *[minecraft:custom_data~{Tags:["skill"]}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["skill"]}}}}]
#再配置
execute if entity @s[tag=!mahou_shoujo_maniac] run loot replace entity @s hotbar.8 loot werewolf:skill/no_skill
execute if entity @s[tag=mahou_shoujo_maniac] run loot replace entity @s hotbar.8 loot werewolf:skill/mahou_shoujo/2_cooltime