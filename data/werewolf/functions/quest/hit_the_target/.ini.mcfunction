## 実行不可の場合の処理
#今回のゲーム全体で実行不可ならリストから削除して再抽選
execute if data storage werewolf: settings{field:"cave"} run return run function werewolf:.util/quest_processing/start/2
##今回のみ実行不可ならreturn
#execute xxx run return fail

## クエスト制限時間(実行不可ならreturn)
#ここに制限時間
scoreboard players set #GameManager reserve_0 2000
execute store result score #GameManager reserve_1 run data get storage werewolf: settings.time.day.tick
scoreboard players operation #GameManager reserve_1 -= #GameManager quest_timer
execute if score #GameManager reserve_1 matches ..0 run return run function werewolf:.util/quest_processing/start/2
execute if score #GameManager reserve_0 >= #GameManager common_timer run return fail

## クエストデータ
#データを破棄
data remove storage werewolf: gamestate.quest.text
#データを再登録
#本 \\uE000:妨害　\\uE001:通常　\\uE002:特殊 
data modify storage werewolf: gamestate.quest.text append value '{"text":"\\uF810\\uE000\\uF811"}'
#内容
data modify storage werewolf: gamestate.quest.text append value '{"text":"偵察部隊を撃墜せよ"}'
data modify storage werewolf: gamestate.quest.text append value '{"text":"目標: 全てのファントムを倒す"}'
data modify storage werewolf: gamestate.quest.text append value '{"text":"報酬:  -"}'
data modify storage werewolf: gamestate.quest.text append value '{"text":"失敗: モンスターの襲来"}'
#bar
data modify storage werewolf: gamestate.quest.text append value '{"text":"\\uF812\\uF000\\uF813"}'

## アナウンス
execute as @a run function werewolf:asset/title/quest/start_wolf
execute as @a run function werewolf:asset/sfx/quest/start
tellraw @a {"text":"[システム] クエスト発生: 偵察部隊を撃墜せよ"}
tellraw @a {"text":"[システム] 全てのファントムを倒せ"}

## クエスト制限時間
scoreboard players operation #GameManager quest_timer = #GameManager reserve_0

## クエストのフラグ管理
data modify storage werewolf: gamestate.quest.active set value true

## クエストバー更新タイミングを算出(quest_bar_timer/quest_bar_update)
scoreboard players operation #GameManager quest_bar_update = #GameManager quest_timer
scoreboard players set #GameManager reserve_0 36
scoreboard players operation #GameManager quest_bar_update /= #GameManager reserve_0
scoreboard players operation #GameManager quest_bar_timer = #GameManager quest_bar_update

## リストの先頭削除
data remove storage werewolf: quest_list_shuffle[0]

## クエスト実行
function werewolf:quest/hit_the_target/summon with storage werewolf: settings
function werewolf:quest/hit_the_target/