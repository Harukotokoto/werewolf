## アイテムセット
execute as @a[tag=team_kaitou] unless items entity @s hotbar.7 *[minecraft:custom_data~{Tags:["role_book"]}] run function werewolf:role/kaitou/playing/set_book
execute as @a[tag=team_kaitou] unless items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill"]}] run function werewolf:role/kaitou/playing/set_skill

## 裁判中ならreturn
execute if data storage werewolf: gamestate.time{id:"trial"} run return fail

## スキル処理(時間により分岐)
execute if data storage werewolf: gamestate.time{id:"first_day"} run function werewolf:role/kaitou/playing/first_day
execute unless data storage werewolf: gamestate.time{id:"first_day"} run function werewolf:role/kaitou/playing/second_day_onwards

## 語り
execute if data storage werewolf: role.kaitou{talk:true} as @a[tag=team_kaitou_origin,tag=player,scores={ID=0..}] run function werewolf:role/kaitou/skill/talking/.nomal

## スキルモード切り替え