##スキル処理
#通常
$execute as @a[scores={protected_new=$(reserve_0)}] run scoreboard players operation @s protected_old = @s protected_new
$execute as @a[scores={protected_new=$(reserve_0)}] run scoreboard players set @s protected_new 0
tag @s remove protected
#ダミー
$execute as @a[scores={protected_dummy_new=$(reserve_0)}] run scoreboard players operation @s protected_dummy_old = @s protected_dummy_new
$execute as @a[scores={protected_dummy_new=$(reserve_0)}] run scoreboard players set @s protected_dummy_new 0
tag @s remove protected_dummy