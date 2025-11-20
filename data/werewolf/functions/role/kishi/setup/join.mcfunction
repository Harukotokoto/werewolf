## tag設定
# 基本設定
#結果出力用の役職タグ
tag @s add team_kishi
#勝利判定用の陣営タグ(wolf/maniac/villager/third)
tag @s add camp_villager

# 追加設定
scoreboard players set @s protected_new 0
scoreboard players set @s protected_old 0
scoreboard players set @s protected_dummy_new 0
scoreboard players set @s protected_dummy_old 0


## スキル関連
# 使用するスキル枠を解放
execute store result score @s skill_limit_0 run data get storage werewolf: role.kishi.skill_0.limit
#execute store result score @s skill_limit_1 run data get storage werewolf: role.kishi.skill_1.limit
#execute store result score @s skill_limit_2 run data get storage werewolf: role.kishi.skill_2.limit
#execute store result score @s skill_limit_3 run data get storage werewolf: role.kishi.skill_3.limit