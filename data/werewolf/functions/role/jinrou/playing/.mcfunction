## アイテムセット
execute as @a[tag=team_jinrou] unless items entity @s hotbar.7 *[minecraft:custom_data~{Tags:["role_book"]}] run function werewolf:role/jinrou/playing/set_book
execute as @a[tag=team_jinrou] unless items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill"]}] run function werewolf:role/jinrou/playing/set_skill

## スキルモード切り替え
execute as @a[tag=team_jinrou,predicate=werewolf:have_item/skill/,predicate=werewolf:flag/is_sneaking,scores={right_click=1..,skill_mode=0}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill"]}] run scoreboard players set @s skill_mode 2
execute as @a[tag=team_jinrou,predicate=werewolf:have_item/skill/,predicate=werewolf:flag/is_sneaking,scores={right_click=1..,skill_mode=1}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill"]}] run scoreboard players set @s skill_mode 0
scoreboard players set @a[tag=team_jinrou,scores={skill_mode=2}] skill_mode 1
execute as @a[tag=team_jinrou,predicate=werewolf:have_item/skill/,predicate=werewolf:flag/is_sneaking,scores={right_click=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill"]}] run item replace entity @s hotbar.8 with air

## 裁判中ならreturn
execute if data storage werewolf: gamestate.time{id:"trial"} run return fail

## スキル処理(時間により分岐)
execute if data storage werewolf: gamestate.time{id:"first_day"} run function werewolf:role/jinrou/playing/first_day
execute unless data storage werewolf: gamestate.time{id:"first_day"} run function werewolf:role/jinrou/playing/second_day_onwards
