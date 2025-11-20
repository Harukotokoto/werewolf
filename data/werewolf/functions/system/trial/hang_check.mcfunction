## 処刑者を決定
scoreboard players set #GameManager reserve_0 0
scoreboard players operation #GameManager reserve_0 > @a votes
scoreboard players operation @a votes -= #GameManager reserve_0
scoreboard players operation #GameManager votes -= #GameManager reserve_0

scoreboard players set #GameManager reserve_1 0
execute as @a[scores={votes=0..}] unless score @s votes <= #GameManager votes run execute store result score #GameManager reserve_1 if entity @a[scores={votes=0..}]

#吊りスキップ有効
execute if data storage werewolf: settings.trial{must_hang:false} if score #GameManager reserve_1 matches 1 run tag @a[scores={votes=0..}] add hang
#吊りスキップ無効
execute if data storage werewolf: settings.trial{must_hang:true} if score #GameManager reserve_1 matches 1 run tag @a[tag=player,scores={votes=0..},sort=random,limit=1] add hang
execute if data storage werewolf: settings.trial{must_hang:true} unless score #GameManager reserve_1 matches 1 run tag @a[tag=player,sort=random,limit=1] add hang