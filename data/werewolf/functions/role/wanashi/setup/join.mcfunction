## tag設定
# 基本設定
#結果出力用の役職タグ
tag @s add team_wanashi
#勝利判定用の陣営タグ(wolf/maniac/villager/third)
tag @s add camp_maniac

# 追加設定



## スキル関連
# 使用するスキル枠を解放
#execute store result score @s skill_limit_0 run data get storage werewolf: role.wanashi.skill_0.limit
#execute store result score @s skill_limit_1 run data get storage werewolf: role.wanashi.skill_1.limit
execute store result score @s skill_limit_2 run data get storage werewolf: role.wanashi.skill_2.limit
#execute store result score @s skill_limit_3 run data get storage werewolf: role.wanashi.skill_3.limit