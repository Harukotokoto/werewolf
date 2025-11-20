## 2日目以降

## スキル持ち替え処理
#切り裂く
execute as @a[tag=team_shuffler,scores={skill_cooltime_0=0}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/shuffler/0
execute as @a[tag=team_shuffler,scores={skill_cooltime_0=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/shuffler/0_cooltime
#シャッフル
execute as @a[tag=team_shuffler,scores={skill_cooltime_2=0}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/shuffler/2
execute as @a[tag=team_shuffler,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/shuffler/2_cooltime

## スキル処理
#切り裂き
execute as @a[tag=team_shuffler,scores={right_click=1..99},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/shuffler/skill/slash/main_0
#シャッフル
execute as @a[tag=team_shuffler,scores={right_click=1..99},predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","2"]}] run function werewolf:role/shuffler/skill/shuffle/main_0

## クールタイム可視化処理
#シャッフル
execute as @a[tag=team_shuffler,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run function werewolf:role/shuffler/skill/shuffle/.cooltime

## アナウンス
execute as @a[tag=team_shuffler,scores={skill_cooltime_0=0},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/shuffler/skill/slash/announce_0

