##初日の昼

## スキル持ち替え処理

## スキル処理
#切り裂き
execute as @a[tag=team_shuffler,scores={right_click=1..},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/shuffler/skill/slash/main_0
#シャッフル
execute as @a[tag=team_shuffler,scores={right_click=1..},predicate=werewolf:have_item/skill/,predicate=!werewolf:flag/is_sneaking] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","2"]}] run function werewolf:role/shuffler/skill/shuffle/main_0