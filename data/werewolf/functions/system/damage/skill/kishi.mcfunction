##騎士の護りフラグ管理
tag @s remove protected

#自分を護った騎士がいるか判定
$execute as @s unless entity @a[team=kishi,scores={protected_new=$(reserve_10)}] run return run function werewolf:system/damage/skill/

#連続守護防止
$execute as @a[scores={protected_new=$(reserve_10)}] run scoreboard players operation @s protected_old = @s protected_new
$execute as @a[scores={protected_new=$(reserve_10)}] run scoreboard players set @s protected_new 0


##演出(要変更)
particle minecraft:totem_of_undying ~ ~1 ~ 0 0 0 0.7 50 force @a
playsound minecraft:item.totem.use master @a ~ ~ ~ 1.0 1 0.0
tellraw @s {"text":"あなたは騎士に守られた。"}

##エフェクト
effect give @s minecraft:regeneration 5 255 true