## right_clickを統合
execute as @a run scoreboard players operation @s right_click += @s right_click_1

## phase処理
execute if data storage werewolf: {phase:"stanby"} run function werewolf:system/phase/stanby/
execute if data storage werewolf: {phase:"switch_playing"} run function werewolf:system/phase/switch_playing/
execute if data storage werewolf: {phase:"playing"} run function werewolf:system/phase/playing/
execute if data storage werewolf: {phase:"switch_stanby"} run function werewolf:system/phase/switch_stanby/


## ログイン検知
scoreboard players add @a login 0
execute as @a[scores={login=0}] run function werewolf:system/login/first_time
execute as @a[scores={login=3..}] run function werewolf:system/login/every_time


##経験値オーブのキル
kill @e[type=experience_orb]

##プレイヤーサイズを固定
execute as @a run attribute @s minecraft:generic.scale base set 0.92448


##フィールド処理


## アイテム関連
execute unless data storage werewolf: {phase:"playing"} run function werewolf:item/


## 右クリック判定リセット
scoreboard players set @a right_click 0
scoreboard players set @a right_click_1 0
## スニーク判定リセット
scoreboard players set @a[scores={is_sneaking=1..},predicate=!werewolf:flag/is_sneaking] is_sneaking 0