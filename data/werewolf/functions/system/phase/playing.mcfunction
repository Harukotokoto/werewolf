##playing

## 現在地を常時記録 
execute as @a[scores={death=0},tag=player,tag=!death_reservation] store result score @s death_x run data get entity @s Pos[0] 1000
execute as @a[scores={death=0},tag=player,tag=!death_reservation] store result score @s death_y run data get entity @s Pos[1] 1000
execute as @a[scores={death=0},tag=player,tag=!death_reservation] store result score @s death_z run data get entity @s Pos[2] 1000
execute as @a[scores={death=0},tag=player,tag=!death_reservation] store result score @s death_rorate_0 run data get entity @s Rotation[0] 1000
execute as @a[scores={death=0},tag=player,tag=!death_reservation] store result score @s death_rorate_1 run data get entity @s Rotation[1] 1000

## 死亡予約処理
execute as @a[tag=death_reservation] run function werewolf:system/death/death_reservation

## 死亡判定
execute if entity @a[scores={death=1..}] run function werewolf:system/death/search
## 死亡後のtp
execute as @e[type=item,tag=death_tp] at @s rotated as @s run function werewolf:system/death/tp_1


## 裁判フェイズの場合は割り込み
execute if data storage werewolf: gamestate.time{id:"trial"} run return run function werewolf:system/trial/playing


## 役職関連
#各役職の処理
function werewolf:.util/role_processing/playing/
#時間回復のスキルクールタイムを更新
execute as @a[scores={skill_cooltime_2=1..}] run scoreboard players remove @s skill_cooltime_2 1
execute as @a[scores={skill_cooltime_3=1..}] run scoreboard players remove @s skill_cooltime_3 1
## bossbar管理
function werewolf:system/bossbar/time/playing
## ランダムクエスト処理
function werewolf:quest/playing
## 墓関連
function werewolf:system/death/grave/playing
## アイテム関連
function werewolf:item/
## ギミック関連
function werewolf:gimmic/
## タスク関連
function werewolf:task/

## フィールド固有
execute if data storage werewolf: settings{field:"village"} run function werewolf:system/phase/playing/field/village/
execute if data storage werewolf: settings{field:"cave"} run function werewolf:system/phase/playing/field/cave/

##状態異常
#満腹度が1の時に空腹の状態異常をクリア
execute as @a[predicate=werewolf:is_effect/hunger,nbt={foodLevel:1}] run effect clear @s hunger