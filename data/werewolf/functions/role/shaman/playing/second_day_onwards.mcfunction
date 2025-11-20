## 2日目以降

## スキル持ち替え処理
execute as @a[tag=team_shaman,scores={skill_cooltime_0=0}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/shaman/0
execute as @a[tag=team_shaman,scores={skill_cooltime_0=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/shaman/0_cooltime

## スキル処理
execute as @a[tag=team_shaman,scores={right_click=1..99},predicate=werewolf:look_at/grave,predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/shaman/skill/main_0

## アナウンス

