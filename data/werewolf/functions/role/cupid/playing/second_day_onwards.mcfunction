## 2日目以降
#loversの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=lovers,tag=player]

## スキル持ち替え処理
execute as @a[tag=team_cupid,scores={skill_cooltime_2=0}] unless score #GameManager reserve_0 matches 2.. if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/cupid/2
execute as @a[tag=team_cupid,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/cupid/2_cooltime
execute if score #GameManager reserve_0 matches 2.. if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/cupid/2_cooltime

## スキル処理
function werewolf:role/cupid/skill/.tick
execute as @a[tag=team_cupid,scores={right_click=1..99},predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","2"]}] run function werewolf:role/cupid/skill/main_0

## クールタイム可視化処理
execute as @a[tag=team_cupid,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run function werewolf:role/cupid/skill/.cooltime

## アナウンス