## tag設定
# 基本設定
#結果出力用の役職タグ
tag @s add team_shuffler
#勝利判定用の陣営タグ(wolf/maniac/villager/third)
tag @s add camp_wolf

# 追加設定
#人狼の役職本(original)に記載されるか
execute as @s[team=shuffler] run tag @s add be_written_jinrou
#ベント移動可能か
execute as @s[team=shuffler] run tag @s add can_use_warp_flame

## スキル関連
# 使用するスキル枠を解放
execute store result score @s skill_limit_0 run data get storage werewolf: role.shuffler.skill_0.limit
#execute store result score @s skill_limit_1 run data get storage werewolf: role.shuffler.skill_1.limit
execute store result score @s skill_limit_2 run data get storage werewolf: role.shuffler.skill_2.limit
#execute store result score @s skill_limit_3 run data get storage werewolf: role.shuffler.skill_3.limit