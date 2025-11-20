##役職の詳細を設定
# 表示名を設定
$data modify storage werewolf: role.$(result).name set value '[{"text":"\\uE100","font":"role_sidebar"},{"text":"\\uF806"}]'
# 陣営を設定(wolf/maniac/villager/third)
$data modify storage werewolf: role.$(result).camp set value "third"
# 最大人数を設定
$data modify storage werewolf: role.$(result).count_max set value 999
# ダミーの可否
$execute unless data storage werewolf: role.$(result).dummy run data modify storage werewolf: role.$(result).dummy set value false
# 設定等の表示可否
$execute unless data storage werewolf: role.$(result).display_settings run data modify storage werewolf: role.$(result).display_settings set value false
# ダミー役職設定の表示可否
$data modify storage werewolf: role.$(result).display_dummy_settings set value false

##スキルを設定
#スキル0(日数回復)
# クールタイム
#$execute unless data storage werewolf: role.$(result).skill_0.cooltime run data modify storage werewolf: role.$(result).skill_0.cooltime set value 1
# 回数制限
#$execute unless data storage werewolf: role.$(result).skill_0.limit run data modify storage werewolf: role.$(result).skill_0.limit set value 999
#スキル1(日数回復)
# クールタイム
#$execute unless data storage werewolf: role.$(result).skill_1.cooltime run data modify storage werewolf: role.$(result).skill_1.cooltime set value 1
# 回数制限
#$execute unless data storage werewolf: role.$(result).skill_1.limit run data modify storage werewolf: role.$(result).skill_1.limit set value 999
#スキル2(時間回復)
# スキル2のデフォルトクールタイム
#$execute unless data storage werewolf: role.$(result).skill_2.cooltime run data modify storage werewolf: role.$(result).skill_2.cooltime set value 600
# スキル2の回数制限
#$execute unless data storage werewolf: role.$(result).skill_2.limit run data modify storage werewolf: role.$(result).skill_2.limit set value 999
#スキル3(時間回復)
# クールタイム
#$execute unless data storage werewolf: role.$(result).skill_3.cooltime run data modify storage werewolf: role.$(result).skill_3.cooltime set value 1
# 回数制限
#$execute unless data storage werewolf: role.$(result).skill_3.limit run data modify storage werewolf: role.$(result).skill_3.limit set value 999

##その他

## 以下、変更不要------------------------------------------------------------------------------------------------------------------

##役職の詳細
# idを設定(変更不要)
$execute store result storage werewolf: role.$(result).id int 1 run scoreboard players get #reserve reserve_0
# 現在の人数が設定されていない場合は0を入力(変更不要)
$execute unless data storage werewolf: role.$(result).count run data modify storage werewolf: role.$(result).count set value 0
##スコアボードに反映
$data modify storage macro: reserve_0 set value "$(result)"
$data modify storage macro: reserve_1 set from storage werewolf: role.$(result).name
$data modify storage macro: reserve_2 set from storage werewolf: role.$(result).id
$data modify storage macro: reserve_3 set from storage werewolf: role.$(result).count
function werewolf:.util/role_processing/count/scoreboard with storage macro:
##スキル設定(秒に変換)
scoreboard players set #GameManager reserve_0 20
$execute store result score #GameManager reserve_1 run data get storage werewolf: role.$(result).skill_2.cooltime
scoreboard players operation #GameManager reserve_1 /= #GameManager reserve_0
$execute store result storage werewolf: role.$(result).skill_2.cooltime_second int 1 run scoreboard players get #GameManager reserve_1
$execute store result score #GameManager reserve_1 run data get storage werewolf: role.$(result).skill_3.cooltime
scoreboard players operation #GameManager reserve_1 /= #GameManager reserve_0
$execute store result storage werewolf: role.$(result).skill_3.cooltime_second int 1 run scoreboard players get #GameManager reserve_1
##チームを作成
##役職チームを作成
# チームを一旦解散
$team remove $(result)
# チーム作成
$team add $(result)
# FFを有効化
$team modify $(result) friendlyFire true
# ネームタグ不可視
$team modify $(result) nametagVisibility never
# 透明化不可視
$team modify $(result) seeFriendlyInvisibles false
# 死亡ログ非表示
$team modify $(result) deathMessageVisibility never