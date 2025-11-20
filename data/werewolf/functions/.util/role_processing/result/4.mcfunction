# 処理を記述

#データがなければreturn
execute unless data storage werewolf: game_result.output.text[0] run return fail

# 結果出力
$tellraw @a [$(result)]
# データ削除
data remove storage werewolf: game_result.output.text[0]
# データ記録
data modify storage macro: util.role_processing.result set from storage werewolf: game_result.output.text[0]

# 再帰処理
function werewolf:.util/role_processing/result/4 with storage macro: util.role_processing