## 2日目以降

## スキル持ち替え処理
execute as @a[tag=team_mahou_shoujo,tag=camp_maniac,scores={skill_cooltime_2=0}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/mahou_shoujo/2
execute as @a[tag=team_mahou_shoujo,tag=camp_maniac,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/mahou_shoujo/2_cooltime
execute if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/mahou_shoujo/2_cooltime

## スキル処理
function werewolf:role/mahou_shoujo/skill/.tick
execute as @a[tag=team_mahou_shoujo,tag=camp_maniac,scores={right_click=1..99},predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","2"]}] run function werewolf:role/mahou_shoujo/skill/main_0

## クールタイム可視化処理
execute as @a[tag=team_mahou_shoujo,tag=camp_maniac,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run function werewolf:role/mahou_shoujo/skill/.cooltime