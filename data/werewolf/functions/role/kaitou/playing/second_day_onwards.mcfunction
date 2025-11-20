## 2日目以降
#参加人数を記録
execute store result score #GameManager reserve_0 run data get storage werewolf: player_list
#生存人数を記録
execute store result score #GameManager reserve_1 if entity @a[tag=player,scores={ID=0..}]
#半数以下か
scoreboard players operation #GameManager reserve_0 /= #GameManager reserve_1


## スキル持ち替え処理
execute as @a[tag=team_kaitou,scores={skill_cooltime_0=0}] if score #GameManager reserve_0 matches 1 if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0","cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/kaitou/0
execute as @a[tag=team_kaitou,scores={skill_cooltime_0=1..}] if items entity @s hotbar.8 *[minecraft:custom_data~{Tags:["skill","0"]},!minecraft:custom_data~{Tags:["cooltime"]}] run loot replace entity @s hotbar.8 loot werewolf:skill/kaitou/0_cooltime

## スキル処理
execute as @a[tag=team_kaitou,scores={right_click=1..99},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/kaitou/skill/main_0

## アナウンス
execute as @a[tag=team_kaitou,scores={skill_cooltime_0=0},predicate=werewolf:look_at/player,predicate=werewolf:have_item/skill/] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run function werewolf:role/kaitou/skill/announce_0

