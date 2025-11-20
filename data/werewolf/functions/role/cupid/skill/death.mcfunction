##恋人陣営処理

#loversの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=lovers,scores={ID=1..}]
execute store result score #GameManager reserve_1 if entity @a[tag=lovers,tag=player,scores={ID=1..}]

#完成前ならloversタグ削除
execute if score #GameManager reserve_0 matches ..1 run return run tag @s remove lovers

#死亡処理後の再実行ならreturn
execute if score #GameManager reserve_1 matches ..1 run return fail

#恋人完成後の場合は恋人陣営全滅
#対象にタグ付け
tag @a[team=cupid,tag=player] add cp_death
tag @a[tag=lovers,tag=player] add cp_death
#現在地を記録 
execute as @a[tag=cp_death] store result score @s death_x run data get entity @s Pos[0] 1000
execute as @a[tag=cp_death] store result score @s death_y run data get entity @s Pos[1] 1000
execute as @a[tag=cp_death] store result score @s death_z run data get entity @s Pos[2] 1000
execute as @a[tag=cp_death] store result score @s death_rorate_0 run data get entity @s Rotation[0] 1000
execute as @a[tag=cp_death] store result score @s death_rorate_1 run data get entity @s Rotation[1] 1000
#対象をキル予約
tag @a[tag=cp_death] add death_reservation
#kill @a[tag=cp_death]
#おかたづけ
tag @a remove cp_death

