## 食あたり処理
execute store result score #GameManager reserve_0 run random value 0..9

execute if score #GameManager reserve_0 matches 7 run effect give @s hunger 15 2 false
execute if score #GameManager reserve_0 matches 8 run effect give @s poison 15 0 false
execute if score #GameManager reserve_0 matches 9 run effect give @s nausea 15 1 false

advancement revoke @s only werewolf:consume_item/quest/eat_quest_salmon
