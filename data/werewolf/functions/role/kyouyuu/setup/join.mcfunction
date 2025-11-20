## tag設定
# 基本設定
#結果出力用の役職タグ
tag @s add team_kyouyuu
#勝利判定用の陣営タグ(wolf/maniac/villager/third)
tag @s add camp_villager

# 追加設定
#共有者の役職本(original)に記載されるか
execute as @s[team=kyouyuu] run tag @s add be_written_kyouyuu


## スキル関連
# 使用するスキル枠を解放
#execute store result score @s skill_limit_0 run data get storage werewolf: role.kyouyuu.skill_0.limit
#execute store result score @s skill_limit_1 run data get storage werewolf: role.kyouyuu.skill_1.limit
#execute store result score @s skill_limit_2 run data get storage werewolf: role.kyouyuu.skill_2.limit
#execute store result score @s skill_limit_3 run data get storage werewolf: role.kyouyuu.skill_3.limit