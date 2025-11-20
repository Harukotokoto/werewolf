##tick
## 発砲
execute as @a[scores={right_click=1}] if items entity @s weapon.offhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand","fire"]}] unless items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand"]}] at @s run function werewolf:item/wand/fire_wand/
execute as @a[scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:damage=0,minecraft:custom_data~{Tags:["wand","fire"]}] at @s run function werewolf:item/wand/fire_wand/

## 弾処理
execute as @e[type=item,tag=magic_bullet,tag=fire] at @s run function werewolf:item/wand/fire_wand/1