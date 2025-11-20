## 2日目以降

## スキル持ち替え処理
execute as @a[tag=team_soujiya,scores={skill_cooltime_0=0}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/soujiya/0
execute as @a[tag=team_soujiya,scores={skill_cooltime_0=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/soujiya/0_cooltime

## スキル処理
execute as @a[tag=team_soujiya,scores={right_click=1..99},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/soujiya/skill/main_0

## アナウンス
execute as @a[tag=team_soujiya,scores={skill_cooltime_0=0},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/soujiya/skill/announce_0

