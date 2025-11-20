##初期設定
##リセット
function werewolf:system/phase/end


##共通セットアップ
#world
gamemode adventure @a
difficulty hard
#ゲーム参加のタグ
execute as @a[team=_entrant] run tag @s add player
#観戦者のゲームモード変更
execute as @a[team=!_entrant] run gamemode spectator @s
#スキルモード解放
scoreboard players set @a skill_mode 0
#スキルクールタイムリセット
scoreboard players set @a skill_cooltime_0 0
scoreboard players set @a skill_cooltime_1 0
scoreboard players set @a skill_cooltime_2 0
scoreboard players set @a skill_cooltime_3 0
#天界チーム作成
team remove _heaven
team add _heaven
#タイトル設定をリセット
title @a reset
#死亡カウントをリセット
scoreboard players set @a death 0
#体力を戻す
execute as @a run attribute @s minecraft:generic.max_health base set 20
#移動速度を戻す
execute as @a run attribute @s minecraft:generic.movement_speed base set 0.1
#落ちているアイテムをキル
kill @e[type=item]
#弓矢をキル
kill @e[type=arrow]


##フィールド関連
#扉を閉めておく
function werewolf:system/close_door/ with storage werewolf: settings


##役職関連
# チーム分け
#役職構成を把握
function werewolf:.util/role_processing/teaming/
#役職振り分け不可ならstanbyに
execute if data storage macro: {reserve_0:1} run return run function werewolf:system/phase/switch_stanby/.ini
# チームのセットアップ
function werewolf:.util/role_processing/join/
# 役職の勝利判定をリセット
data remove storage werewolf: game_result
# 村人を含めたスコアボードに更新
function werewolf:.util/role_processing/count/reload_active_role_list_in_game/
# 役職ごとの最終処理
function werewolf:.util/role_processing/start/
# あらかじめ役職を記録しておく
function werewolf:.util/role_processing/save_role/



##ランダムクエスト設定
#クエストリセット
data remove storage werewolf: gamestate.quest
#クエストを並び替え
function werewolf:.util/quest_processing/shuffle/
#タイマーを設定
scoreboard players set #GameManager quest_timer 1000


##ショップ設定
function werewolf:shop/set_products with storage werewolf: settings.shop.price


##時間を更新
function werewolf:system/time_change/first_day


##bossbar関連
#bossbar削除
function werewolf:system/bossbar/.reset/
#全員に個別IDを付与
function werewolf:.util/set_id/everyone/
#プレイヤーリストを作成
function werewolf:.util/get_name_list/
#全員にbossbarを付与
function werewolf:system/bossbar/.ini/everyone/


##プレイヤーを指定位置にtp
schedule function werewolf:system/set_player/ 2s

##空腹を調節
effect give @a hunger 3 200 true

##アイテムを配布
function werewolf:system/give/

