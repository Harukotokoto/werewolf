# 処理を記述
#役職人数を加算
#execute unless data storage macro: util.role_processing{count:0} run \
#function werewolf:.util/role_processing/teaming/1 with storage macro: util.role_processing


# データが無ければreturn
#$execute unless data storage werewolf: active_role_list[$(count)] run return run data modify storage macro: util.role_processing.count set value 0

# 再帰後の処理対象を更新
#$data modify storage macro: util.role_processing.result set from storage werewolf: active_role_list[$(count)]
# カウントアップ
#execute unless data storage macro: util.role_processing{count:0} run execute store result storage macro: util.role_processing.count int -1 run data get storage macro: util.role_processing.count -1.01
#execute if data storage macro: util.role_processing{count:0} run data modify storage macro: util.role_processing.count set value 1


# 再帰処理
#function werewolf:.util/role_processing/teaming/0 with storage macro: util.role_processing





# 全陣営を合計する
##狼
execute store result score #reserve reserve_0 run data get storage werewolf: camp_details.count.wolf
#人数固定が有効の場合
execute unless data storage werewolf: settings.gamemode{role_count_limit:0} run execute store result score #reserve reserve_1 run data get storage werewolf: settings.gamemode.role_count_limit
execute unless data storage werewolf: settings.gamemode{role_count_limit:0} if score #reserve reserve_0 > #reserve reserve_1 store result score #reserve reserve_0 run data get storage werewolf: settings.gamemode.role_count_limit

##村
execute store result score #reserve reserve_1 run data get storage werewolf: camp_details.count.villager
scoreboard players operation #reserve reserve_0 += #reserve reserve_1

##第三
execute store result score #reserve reserve_1 run data get storage werewolf: camp_details.count.third
scoreboard players operation #reserve reserve_0 += #reserve reserve_1