##初日の昼

## スキル持ち替え処理

## スキル処理
execute as @a[tag=team_uranai,scores={right_click=1..},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/uranai/skill/main_0