##cooltimeを耐久ゲージを反映

## 割合を計算(*1000)
scoreboard players set #GameManager reserve_0 1000
execute store result score #GameManager reserve_1 run scoreboard players get @s skill_cooltime_2
scoreboard players operation #GameManager reserve_1 *= #GameManager reserve_0
execute store result score #GameManager reserve_2 run data get storage werewolf: role.mahou_shoujo.skill_2.cooltime
scoreboard players operation #GameManager reserve_1 /= #GameManager reserve_2
scoreboard players operation #GameManager reserve_0 -= #GameManager reserve_1
## 表示の調節
scoreboard players set #GameManager reserve_1 36
scoreboard players operation #GameManager reserve_0 -= #GameManager reserve_1

## 耐久ゲージに反映
item modify entity @s hotbar.8 werewolf:set_damage/skill_cooltime



