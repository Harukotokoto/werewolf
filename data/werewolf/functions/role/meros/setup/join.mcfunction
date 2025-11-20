## tag設定
# 基本設定
#結果出力用の役職タグ
tag @s add team_meros
#勝利判定用の陣営タグ(wolf/maniac/villager/third)
tag @s add camp_villager

# 追加設定
#勝利判定に含まない
tag @s add no_judgment



## スキル関連
# 使用するスキル枠を解放
#execute store result score @s skill_limit_0 run data get storage werewolf: role.meros.skill_0.limit
#execute store result score @s skill_limit_1 run data get storage werewolf: role.meros.skill_1.limit
#execute store result score @s skill_limit_2 run data get storage werewolf: role.meros.skill_2.limit
#execute store result score @s skill_limit_3 run data get storage werewolf: role.meros.skill_3.limit

#移動スコアをリセット
scoreboard players reset @s hm_death
#報酬までの時間をリセット
scoreboard players reset @s hm_reward