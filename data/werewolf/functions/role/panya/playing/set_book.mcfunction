## 役職本配置

## 役職本セット
#slotに入ったアイテムをcursorに返却
item replace entity @s player.cursor from entity @s hotbar.7
#流出したアイテムをclear
clear @s *[minecraft:custom_data~{Tags:["role_book"]}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["role_book"]}}}}]
#再配置
item replace entity @s hotbar.7 with minecraft:written_book[\
    minecraft:custom_model_data=2,\
    minecraft:written_book_content=\
        {pages:['[[\
            {"text":"\\uF990\\uE000\\uF991\\uE10C\\uF992","color":"white","font":"role_book"},\
            {"text":"\\uE10D\\uF993","color":"white","font":"role_book"}\
        ]]'],title:"役職が記された本",author:"",resolved:false},\
    minecraft:custom_data={Tags:["role_book","no_drop"]},\
    minecraft:enchantment_glint_override=false]