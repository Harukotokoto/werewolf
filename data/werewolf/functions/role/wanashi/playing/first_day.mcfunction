##初日の昼

## スキル持ち替え処理

## スキル処理
execute as @a[tag=team_wanashi,scores={right_click=1..},predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","2"]}] run function werewolf:role/wanashi/skill/main_0