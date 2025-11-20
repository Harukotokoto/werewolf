## 2日目以降

## スキル持ち替え処理
#切り裂く
execute as @a[tag=team_jinrou,scores={skill_cooltime_0=0}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/jinrou/0
execute as @a[tag=team_jinrou,scores={skill_cooltime_0=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/jinrou/0_cooltime
#咆哮
execute as @a[tag=team_jinrou,scores={skill_cooltime_2=0}] if data storage werewolf: gamestate.time{id:"night"} if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/jinrou/2
execute as @a[tag=team_jinrou,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/jinrou/2_cooltime
execute as @a[tag=team_jinrou] unless data storage werewolf: gamestate.time{id:"night"} if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/jinrou/2_cooltime

## スキル処理
#切り裂き
execute as @a[tag=team_jinrou,scores={right_click=1..99},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/jinrou/skill/slash/main_0
#咆哮
function werewolf:role/jinrou/skill/roar/.tick
execute as @a[tag=team_jinrou,scores={right_click=1..99},predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","2"]}] run function werewolf:role/jinrou/skill/roar/main_0

## クールタイム可視化処理
#咆哮
execute as @a[tag=team_jinrou,scores={skill_cooltime_2=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","2","cooltime"]}] run function werewolf:role/jinrou/skill/roar/.cooltime

## アナウンス
execute as @a[tag=team_jinrou,scores={skill_cooltime_0=0},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/jinrou/skill/slash/announce_0

