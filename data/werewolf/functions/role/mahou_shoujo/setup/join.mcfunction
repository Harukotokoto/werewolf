## tag設定
# 基本設定

#ランダムに役職を選びその役職joinを実行(join実行でthis_mahou_shoujoタグを付与)
execute unless entity @s[tag=no_get_dummy] run function werewolf:role/mahou_shoujo/skill/

#不要な陣営タグを削除
tag @s remove camp_wolf
tag @s remove camp_maniac
tag @s remove camp_third

#勝利判定用の陣営タグ(wolf/maniac/villager/third)
tag @s add camp_villager
tag @s add team_mahou_shoujo
#役職を引いていなければポンコツ本体として参加
execute as @s[tag=this_mahou_shoujo] run tag @s add dummy_role

#勝利判定除外タグを削除
tag @s remove no_judgment
#おかたづけ
tag @s remove this_mahou_shoujo


#役職被強奪時処理
execute if entity @a[tag=role_changing,tag=mahou_shoujo_maniac,scores={ID=1..}] run tag @s add mahou_shoujo_maniac
