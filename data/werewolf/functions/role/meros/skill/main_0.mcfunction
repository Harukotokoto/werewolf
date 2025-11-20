## 移動しているかの判定処理
#事前準備
scoreboard players set @s reserve_0 0
scoreboard players set @s reserve_1 -1

#行動をスコア化
scoreboard players operation @s reserve_0 += @s hm_crouch_one_cm
scoreboard players operation @s reserve_0 += @s hm_sprint_one_cm
scoreboard players operation @s reserve_0 += @s hm_walk_one_cm
scoreboard players operation @s reserve_0 += @s hm_walk_on_water_one_cm
scoreboard players operation @s reserve_0 += @s hm_walk_under_water_one_cm
scoreboard players operation @s reserve_0 += @s hm_swim_one_cm
execute store result score @s hm_y_one_cm run data get entity @s Motion[1] 50
execute if score @s hm_y_one_cm matches ..0 run scoreboard players operation @s hm_y_one_cm *= @s reserve_1
execute if score @s hm_y_one_cm matches ..4 run scoreboard players set @s hm_y_one_cm 0
scoreboard players operation @s reserve_0 += @s hm_y_one_cm
scoreboard players operation @s reserve_0 += @s hm_fly_one_cm
scoreboard players operation @s reserve_0 += @s hm_fall_one_cm

#動いていなければ死亡までのカウントを進める
execute if score @s reserve_0 matches ..1 run scoreboard players add @s hm_death 1
execute unless score @s reserve_0 matches ..1 run scoreboard players set @s hm_death 0
#報酬までのカウントを進める
scoreboard players add @s hm_reward 1

#死亡処理
#execute if score @s hm_death = #GameManager hm_death run tellraw @s {"text":"dead!","color":"red"}
execute if score @s hm_death = #GameManager hm_death run tellraw @s {"text":"メロスは間に合わなかった。","color":"red"}
execute if score @s hm_death = #GameManager hm_death run kill @s
#報酬配布処理
#execute if score @s hm_reward = #GameManager hm_reward run tellraw @s {"text":"get reward!","color":"green"}
execute if score @s hm_reward = #GameManager hm_reward run function werewolf:role/meros/skill/main_1

#リセット
scoreboard players set @s hm_crouch_one_cm 0
scoreboard players set @s hm_sprint_one_cm 0
scoreboard players set @s hm_walk_one_cm 0
scoreboard players set @s hm_walk_on_water_one_cm 0
scoreboard players set @s hm_walk_under_water_one_cm 0
scoreboard players set @s hm_swim_one_cm 0
scoreboard players set @s hm_y_one_cm 0
scoreboard players set @s hm_fly_one_cm 0
scoreboard players set @s hm_fall_one_cm 0
scoreboard players reset @s reserve_0
scoreboard players reset @s reserve_1