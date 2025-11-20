## 2日目以降

##スキル処理
#人狼探知スキル
execute as @a[tag=team_kyoujin,scores={right_click=1..99},predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/kyoujin/skill/main_0