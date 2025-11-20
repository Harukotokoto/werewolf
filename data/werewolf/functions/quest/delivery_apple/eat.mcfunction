## 食あたり処理
execute store result score #GameManager reserve_0 run random value 0..9

execute if score #GameManager reserve_0 matches 7.. run effect give @s hunger 10 20
execute if score #GameManager reserve_0 matches 7.. run effect give @s poison 5 0

advancement revoke @s only werewolf:consume_item/quest/eat_rot_apple
