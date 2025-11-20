##全てのタグ削除
function werewolf:.util/role_processing/reset/only/
##タグ追加
tag @s add team_mahou_shoujo
tag @s add camp_maniac
tag @s add mahou_shoujo_maniac
# 死亡カウントをリセット
scoreboard players set @s death 0

## スキル関連
# 使用するスキル枠を解放
#execute store result score @s skill_limit_0 run data get storage werewolf: role.mahou_shoujo.skill_0.limit
#execute store result score @s skill_limit_1 run data get storage werewolf: role.mahou_shoujo.skill_1.limit
execute store result score @s skill_limit_2 run data get storage werewolf: role.mahou_shoujo.skill_2.limit
#execute store result score @s skill_limit_3 run data get storage werewolf: role.mahou_shoujo.skill_3.limit

tag @s add me

## 墓が残らないように
execute positioned ~ ~1 ~ as @e[type=item,tag=grave,distance=..1] if score @s ID = @a[tag=me,limit=1,sort=nearest] ID run kill @s
## 墓上の硬直を短時間で解除するように
execute as @e[type=item,tag=death_tp] if score @s ID = @a[tag=me,limit=1,sort=nearest] ID run data modify entity @s Age set value 5998

tag @s remove me

##演出
tellraw @s {"text":"あなたはこの世界に絶望している。","color":"red"}
playsound minecraft:particle.soul_escape master @a ~ ~ ~ 5.0 1.5 0.0
playsound minecraft:item.trident.thunder master @a ~ ~ ~ 0.3 1.5 0.0
execute positioned ~ ~1 ~ run function werewolf:role/mahou_shoujo/skill/reborn_particle