## tag設定
# 基本設定

#ランダムに役職を選びその役職joinを実行(join実行でthis_ponkotsuタグを付与)
execute unless entity @s[tag=no_get_dummy] run function werewolf:role/ponkotsu/skill/

#不要な陣営タグを削除
tag @s remove camp_wolf
tag @s remove camp_maniac
tag @s remove camp_third

#勝利判定用の陣営タグ(wolf/maniac/villager/third)
tag @s add camp_villager
tag @s add team_ponkotsu
#役職を引いていなければポンコツ本体として参加
execute as @s[tag=this_ponkotsu] run tag @s add dummy_role

#勝利判定除外タグを削除
tag @s remove no_judgment
#おかたづけ
tag @s remove this_ponkotsu