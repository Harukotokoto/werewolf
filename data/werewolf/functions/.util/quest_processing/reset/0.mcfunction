# 処理を記述
$execute unless data storage macro: util.quest_processing{count:0} run \
execute as @a run function werewolf:quest/$(result)/reset

# データが無ければreturn
$execute unless data storage werewolf: quest_list[$(count)] run return run data modify storage macro: util.quest_processing.count set value 0

# 再帰後の処理対象を更新
$data modify storage macro: util.quest_processing.result set from storage werewolf: quest_list[$(count)]
# カウントアップ
execute unless data storage macro: util.quest_processing{count:0} run execute store result storage macro: util.quest_processing.count int -1 run data get storage macro: util.quest_processing.count -1.01
execute if data storage macro: util.quest_processing{count:0} run data modify storage macro: util.quest_processing.count set value 1


# 再帰処理
function werewolf:.util/quest_processing/reset/0 with storage macro: util.quest_processing