##verを記載
data modify storage werewolf: version set value "Ver 3.0.0"

##チームリストを作成
# 初期化
data remove storage werewolf: role_list
execute unless data storage macro: util.role_processing{third_camp:1} run data modify storage macro: util.role_processing.third_camp set value 0
# チームを追加
#人狼
data modify storage werewolf: role_list append value "jinrou"
data modify storage werewolf: role_list append value "assassin"
data modify storage werewolf: role_list append value "shuffler"
#狂人
data modify storage werewolf: role_list append value "kyoujin"
data modify storage werewolf: role_list append value "kyoushin"
data modify storage werewolf: role_list append value "wanashi"
#村
data modify storage werewolf: role_list append value "mura"
data modify storage werewolf: role_list append value "uranai"
data modify storage werewolf: role_list append value "reinou"
data modify storage werewolf: role_list append value "kishi"
data modify storage werewolf: role_list append value "soujiya"
data modify storage werewolf: role_list append value "kyouyuu"
data modify storage werewolf: role_list append value "panya"
data modify storage werewolf: role_list append value "ponkotsu"
data modify storage werewolf: role_list append value "ojousama"
data modify storage werewolf: role_list append value "saibankan"
data modify storage werewolf: role_list append value "kaitou"
data modify storage werewolf: role_list append value "meros"
data modify storage werewolf: role_list append value "shaman"
data modify storage werewolf: role_list append value "mahou_shoujo"
#第三
data modify storage werewolf: role_list append value "youko"
data modify storage werewolf: role_list append value "haitoku"
data modify storage werewolf: role_list append value "shinigami"
data modify storage werewolf: role_list append value "cupid"
data modify storage werewolf: role_list append value "teruteru"


##クエストリストを作成
# 初期化
data remove storage werewolf: quest_list
# クエストを追加
data modify storage werewolf: quest_list append value "random_teleport"
data modify storage werewolf: quest_list append value "acid_rain"
data modify storage werewolf: quest_list append value "hit_the_target"
data modify storage werewolf: quest_list append value "stray_wolf"
data modify storage werewolf: quest_list append value "falling_salmon"
data modify storage werewolf: quest_list append value "poison_axolotl"
data modify storage werewolf: quest_list append value "ancient_hidden_room"
data modify storage werewolf: quest_list append value "delivery_bread"
data modify storage werewolf: quest_list append value "delivery_apple"
data modify storage werewolf: quest_list append value "cave_in"
data modify storage werewolf: quest_list append value "maido_ookini"
data modify storage werewolf: quest_list append value "lost_bread"
data modify storage werewolf: quest_list append value "where_is_my_wolf"
data modify storage werewolf: quest_list append value "security_up"
data modify storage werewolf: quest_list append value "inventory_exchange"
data modify storage werewolf: quest_list append value "crystal_collecting"
data modify storage werewolf: quest_list append value "add_job_change_item_villager"

##待機用のチームを作成
team add _entrant
team add _spectator
team modify _spectator nametagVisibility never

##発光用のチームを作成
team add glowing_red
team modify glowing_red color red

##フィールドの初期設定
execute unless data storage werewolf: settings.field run data modify storage werewolf: settings.field set value "village"

##人狼役職の最大人数制限設定
execute unless data storage werewolf: settings.gamemode.role_count_limit run data modify storage werewolf: settings.gamemode.role_count_limit set value 0

##死亡場所にプレイヤーを固定
execute unless data storage werewolf: settings.gamemode.death_place_fixed run data modify storage werewolf: settings.gamemode.death_place_fixed set value false

## 昼夜サイクルの初期設定
#共通タイマー
scoreboard objectives add common_timer dummy
#時間の初期設定
execute unless data storage werewolf: settings.time.first_day.tick run data modify storage werewolf: settings.time.first_day.tick set value 1200
execute unless data storage werewolf: settings.time.first_day.second run data modify storage werewolf: settings.time.first_day.second set value 60
execute unless data storage werewolf: settings.time.day.tick run data modify storage werewolf: settings.time.day.tick set value 3600
execute unless data storage werewolf: settings.time.day.second run data modify storage werewolf: settings.time.day.second set value 180
execute unless data storage werewolf: settings.time.night.tick run data modify storage werewolf: settings.time.night.tick set value 1200
execute unless data storage werewolf: settings.time.night.second run data modify storage werewolf: settings.time.night.second set value 60

## クエストの初期設定
#タイマー
execute unless data storage werewolf: settings.quest.interval run data modify storage werewolf: settings.quest.interval set value 1000
scoreboard objectives add quest_timer dummy
scoreboard objectives add quest_bar_timer dummy
scoreboard objectives add quest_bar_update dummy
#クエストモード設定
execute unless data storage werewolf: settings.gamemode.quest run data modify storage werewolf: settings.gamemode.quest set value true

##アニメーション設定
execute unless data storage werewolf: settings.anim.windmill run data modify storage werewolf: settings.anim.windmill set value false
execute unless data storage werewolf: settings.anim.crystal run data modify storage werewolf: settings.anim.crystal set value false

##個別ID
scoreboard objectives add ID dummy


##ログイン検知
scoreboard objectives add login minecraft.custom:minecraft.leave_game


##現在地記録用
scoreboard objectives add death_x dummy
scoreboard objectives add death_y dummy
scoreboard objectives add death_z dummy
scoreboard objectives add death_rorate_0 dummy
scoreboard objectives add death_rorate_1 dummy


##.util
# role_processingのセットアップ
data modify storage macro: util.role_processing.count set value 0
data modify storage macro: util.role_processing.number set value 0
data modify storage macro: util.role_processing.result set value "null"
data modify storage macro: util.role_processing.camp set value "null"
# inventory_uiのセットアップ
#初期化
data remove storage macro: util.inventory_ui.func
#ボタンの処理を事前に設定
data modify storage macro: util.inventory_ui.func.slot_9 set value "werewolf:system/inventory_ui/slot_9/"
data modify storage macro: util.inventory_ui.func.slot_10 set value "werewolf:system/inventory_ui/slot_10/"
data modify storage macro: util.inventory_ui.func.slot_11 set value "werewolf:system/inventory_ui/slot_11/"
#scoreboard
scoreboard objectives remove ui_ready
scoreboard objectives add ui_ready dummy
scoreboard players set @a ui_ready 0
scoreboard objectives add phase_switcher dummy


##役職表示のためのscoreboard作成
scoreboard objectives add role_list dummy
scoreboard objectives modify role_list displayname {"text":"\uE503"}
scoreboard objectives setdisplay sidebar role_list


##スキル用のscoreboard
scoreboard objectives add skill_mode dummy
#通常用(日数回復)
scoreboard objectives add skill_cooltime_0 dummy
scoreboard objectives add skill_cooltime_1 dummy
#特殊用(時間回復)
scoreboard objectives add skill_cooltime_2 dummy
scoreboard objectives add skill_cooltime_3 dummy
#使用回数設定用
scoreboard objectives add skill_limit_0 dummy
scoreboard objectives add skill_limit_1 dummy
scoreboard objectives add skill_limit_2 dummy
scoreboard objectives add skill_limit_3 dummy

##タスク用のscoreboard
#破壊ロック
scoreboard objectives add can_mining_task dummy
#ブロック破壊検知用スコアボード
scoreboard objectives add mined.oak_log mined:oak_log
scoreboard objectives add mined.iron_ore mined:iron_ore
scoreboard objectives add mined.wheat mined:wheat
scoreboard objectives add mined.red_mushroom mined:red_mushroom
scoreboard objectives add mined.brown_mushroom mined:brown_mushroom
scoreboard objectives add mined.diamond_ore mined:diamond_ore

##アイテム用のscoreboard
scoreboard objectives add swords_cooltime dummy
scoreboard objectives add charge_magic_bullet dummy

##緊急裁判
#緊急裁判の初期設定
execute unless data storage werewolf: settings.time.trial.tick run data modify storage werewolf: settings.time.trial.tick set value 2400
execute unless data storage werewolf: settings.time.trial.second run data modify storage werewolf: settings.time.trial.second set value 120
#投票用のscoreboard
scoreboard objectives add can_vote dummy
#票カウント用scoreboard
scoreboard objectives add votes dummy
#緊急招集ボタン
scoreboard objectives add trial_button dummy
#裁判の度に必ず1人吊るかの設定
execute unless data storage werewolf: settings.trial.must_hang run data modify storage werewolf: settings.trial.must_hang set value false
#裁判語に墓を消滅させるかの設定
execute unless data storage werewolf: settings.trial.delete_grave run data modify storage werewolf: settings.trial.delete_grave set value true

##bossbar用のscoreboard
scoreboard objectives add bossbar_negative dummy


##右クリック検知
scoreboard objectives add right_click minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add right_click_1 minecraft.used:minecraft.warped_fungus_on_a_stick

##スニーク検知
scoreboard objectives add is_sneaking minecraft.custom:minecraft.sneak_time

##死亡検知
scoreboard objectives add death deathCount

##便利なscoreboard作成
scoreboard objectives add reserve_0 dummy
scoreboard objectives add reserve_1 dummy
scoreboard objectives add reserve_2 dummy
scoreboard objectives add reserve_3 dummy
scoreboard objectives add reserve_4 dummy
scoreboard objectives add reserve_5 dummy

##debug_mode
execute unless data storage werewolf: settings.debug run data modify storage werewolf: settings.debug set value false

##ショップの価格設定を更新
function werewolf:shop/

##全役職の初期設定
function werewolf:.util/role_processing/.ini/

##選択役職を更新
function werewolf:.util/role_processing/count/reload_active_role_list/


##ゲームフェーズを待機に
function werewolf:system/phase/stanby/.ini


##ゲームをリセット
schedule function werewolf:system/phase/end 1t

##bossbar更新
schedule function werewolf:system/bossbar/.reset/ 1t
schedule function werewolf:.util/set_id/everyone/ 1t
schedule function werewolf:system/bossbar/.ini/everyone/ 1t