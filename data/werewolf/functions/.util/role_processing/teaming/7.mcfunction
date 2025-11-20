##プレイヤー内に狼がいない場合の処理
#チームとタグをリセット
execute as @e[tag=role_assigning] run team join _entrant
execute as @a[tag=role_assigning] run tag @s remove wolf_tentative
execute as @a[tag=role_assigning] run tag @s remove villager_tentative

##役職を割り振る
function werewolf:.util/role_processing/teaming/3 with storage macro: util.role_processing

##人狼とその他陣営の人数調整設定
#werewolf: settings.gamemode.role_count_limit を記録
 execute store result score #reserve reserve_0 run data get storage werewolf: settings.gamemode.role_count_limit
#人狼になる可能性がある最大人数を記録
 execute store result score #reserve reserve_1 run data get storage werewolf: camp_details.count.wolf
#人狼の人数 を記録
 execute store result score #reserve reserve_2 if entity @a[tag=wolf_tentative]
#参加プレイヤーの人数を保存
 execute store result score #reserve reserve_3 if entity @a[tag=player]
#使用するスコアボードを整備
scoreboard players set #reserve reserve_4 0
#人狼になる可能性がある最大人数 < role_count_limit の場合
 #role_count_limit を 人狼になる可能性がある最大人数 に置き換えて以下を処理
  execute if score #reserve reserve_1 < #reserve reserve_0 run scoreboard players operation #reserve reserve_0 = #reserve reserve_1
#参加人数 < role_count_limit の場合
 #参加人数 -1 をrole_count_limit に置き換えて以下を処理
  execute if score #reserve reserve_3 < #reserve reserve_0 run scoreboard players set #reserve reserve_4 1
  execute if score #reserve reserve_4 matches 1 run scoreboard players operation #reserve reserve_0 = #reserve reserve_3
  execute if score #reserve reserve_4 matches 1 run scoreboard players remove reserve reserve_0 1
#role_count_limitが 0 なら 1 に置き換えて以下を処理
 execute if score #reserve reserve_0 matches 0 unless score #reserve reserve_1 matches 0 run scoreboard players set reserve reserve_0 1
#人狼の人数 = role_count_limit の場合
 #処理終了
  execute if score #reserve reserve_0 = #reserve reserve_2 run return fail
# 役職人数に問題ありなら再度処理
function werewolf:.util/role_processing/teaming/7