##初日の昼

## スキル処理
execute as @a[tag=team_mahou_shoujo,tag=camp_maniac,scores={right_click=1..99},predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","2"]}] run function werewolf:role/mahou_shoujo/skill/main_0