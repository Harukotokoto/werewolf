##共通の処理
#ゲーム参加のタグ削除
execute as @a run tag @s remove player
execute as @a run tag @s remove no_ability_activation
#その他タグ削除
execute as @a run tag @s remove death_reservation
#ゲームモード変更
gamemode adventure @a
#時間リセット
time set 3000
#エフェクトクリア
effect clear @a
#inventory_ui用
scoreboard players set @a ui_ready 0
#スキル用scoreboard
scoreboard players reset @a skill_cooltime_0
scoreboard players reset @a skill_cooltime_1
#勝利陣営保存用storageをリセット
data remove storage werewolf: winning_camp
#storage整理
data remove storage werewolf: gamestate.day_count.text
#墓をキル
kill @e[tag=grave]
#アイテムをキル
kill @e[type=item]
#弓矢をキル
kill @e[type=arrow]
#裁判用のボタンリセット
scoreboard players reset @a trial_button
#体力を戻す
execute as @a run attribute @s minecraft:generic.max_health base set 20
#移動速度を戻す
execute as @a run attribute @s minecraft:generic.movement_speed base set 0.1
#重力を戻す
execute as @a run attribute @s minecraft:generic.gravity base set 0.08
#死亡リストをリセット
data remove storage werewolf: game_state.trial.dead
#報酬以外のアイテムをクリア
clear @a *[!minecraft:custom_data~{Tags:["reward"]}]

##チームごとの処理
function werewolf:.util/role_processing/reset/everyone/

##フィールドの処理


##タスクをリセット
function werewolf:task/reset

##クエストをリセット
function werewolf:.util/quest_processing/reset/

##サイドバーを正常化 ------------------------------------------のちに最適化予定
#全役職の初期設定
function werewolf:.util/role_processing/.ini/
#選択役職を更新
function werewolf:.util/role_processing/count/reload_active_role_list/


#設定ボスバーを表示--------------------------------------------------------------------------------




