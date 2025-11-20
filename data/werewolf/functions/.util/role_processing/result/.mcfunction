##共通処理


##追加結果をstorageに記録/勝利演出の実行
function werewolf:.util/role_processing/result/0 with storage macro: util.role_processing

##出力を予約
data modify storage werewolf: game_result.output.text append value '[{"text":""}]'
data modify storage werewolf: game_result.output.text append value '[{"text":"[Result]"}]'
#勝利陣営
function werewolf:.util/role_processing/result/1
#陣営一覧
function werewolf:.util/role_processing/result/2
#区切り
execute if data storage werewolf: game_result.sub run data modify storage macro: util.role_processing.result set value '--------------------------------------'
#特殊要素
execute if data storage werewolf: game_result.sub run function werewolf:.util/role_processing/result/3 with storage macro: util.role_processing
#エラー回避
execute if data storage werewolf: game_result.sub run data modify storage macro: util.role_processing.result set value 'help'

#title
title @a times 0.5s 1.2s 0.5s
title @a title {"text":"\uE000","font":"role_view"}
#一定時間後tp
schedule function werewolf:system/tp/start_point/everyone/ 1s
#一定時間後報酬配布
#schedule function werewolf:.util/role_processing/reward/ 1s
#一定時間経過後出力
schedule function werewolf:.util/role_processing/result/6 3s

##ゲーム終了
#schedule function werewolf:system/phase/end 3s
# bossbar更新
#schedule function werewolf:.util/set_id/everyone/ 3s
#schedule function werewolf:system/bossbar/.ini/everyone/ 3s