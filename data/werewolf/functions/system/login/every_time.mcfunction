##ワールドログイン時のメッセージ
tellraw @s "[システム] この世界に帰還しました。"


execute unless score @s ID matches 0.. run tag @s add no_id
##bossbar作成
execute as @s[tag=no_id] run function werewolf:.util/set_id/only/
execute as @s[tag=no_id] run function werewolf:system/bossbar/.ini/only/
# ゲーム中に付与されたデータをリセット
execute as @s[tag=no_id] run function werewolf:.util/role_processing/reset/only/
tag @s remove no_id


##スタンバイ中
#ゲーム参加中のタグを削除
execute if data storage werewolf: {phase:"stanby"} run tag @s remove player
#スポーン場所にtp
execute if data storage werewolf: {phase:"stanby"} run function werewolf:system/tp/start_point/only/


##ゲーム中
#ゲームに参加していなければ観戦チームに入れる
execute unless data storage werewolf: {phase:"stanby"} run team join _spectator @s[tag=!player]
#会議中なら会議チャットを表示



##ログイン用scoreboard操作
scoreboard players set @s login 2