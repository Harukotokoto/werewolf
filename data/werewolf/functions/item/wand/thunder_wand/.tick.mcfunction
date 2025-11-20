##tick
## 発砲
execute as @a[scores={right_click=1}] if items entity @s weapon.offhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand","thunder"]}] unless items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] at @s run function werewolf:item/wand/thunder_wand/
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand","thunder"]}] at @s run function werewolf:item/wand/thunder_wand/

## 弾処理
execute as @e[type=item,tag=magic_bullet,tag=thunder] at @s run function werewolf:item/wand/thunder_wand/1