## スキル配置

## スキルセット
#slotに入ったアイテムをcursorに返却
item replace entity @s player.cursor from entity @s hotbar.8
#流出したアイテムをclear
clear @s *[minecraft:custom_data~{Tags:["skill"]}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["skill"]}}}}]
#ダイヤモンド所持数をチェック
execute store result score @s reserve_0 run clear @s diamond 0
#再配置（ダイヤモンドが2個以上なら使用可能、未満なら使用不可）
execute if score @s reserve_0 matches 2.. run loot replace entity @s hotbar.8 loot werewolf:skill/kyoujin/0
execute if score @s reserve_0 matches ..1 run loot replace entity @s hotbar.8 loot werewolf:skill/kyoujin/0_unavailable