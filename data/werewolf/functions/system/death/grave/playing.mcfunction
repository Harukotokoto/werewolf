## 墓関連
#墓生成のチェック
execute as @e[type=item,tag=grave,tag=not_yet] run function werewolf:system/death/grave/check
#墓アナウンス
execute if entity @e[type=interaction,tag=grave] run function werewolf:system/death/grave/announce_0
#演出
execute as @e[type=interaction,tag=grave] at @s run particle effect ~ ~-0.1 ~ 0.1 0.1 0.1 0 1