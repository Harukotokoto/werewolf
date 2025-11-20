##ワールド初回ログイン時のメッセージ
tellraw @s "--生き残るために闘うオトギバナシ--"
tellraw @s "マイクラ人狼クエストの世界へようこそ"
tellraw @s ""
tellraw @s "詳しいゲーム説明は同梱のReadmeをご覧ください"

##初回設定
scoreboard players set @s bossbar_negative 5

##bossbar作成
execute unless score @s ID matches 0.. run tag @s add no_id
execute as @s[tag=no_id] run function werewolf:.util/set_id/only/
execute as @s[tag=no_id] run function werewolf:system/bossbar/.ini/only/
tag @s remove no_id

##スタンバイ中
#スポーン場所にtp
execute if data storage werewolf: {phase:"stanby"} run function werewolf:system/tp/start_point/only/


##ゲーム中
#ゲームに参加していなければ観戦チームに入れる
execute unless data storage werewolf: {phase:"stanby"} run team join _spectator @s[tag=!player]
#会議中なら会議チャットを表示






##ログイン用scoreboard操作
scoreboard players set @s login 2