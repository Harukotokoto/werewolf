##勝利判定

#裁判で吊られたとき直接指定
data modify storage werewolf: winning_camp set value "teruteru_0"

##結果出力
data modify storage werewolf: game_result.win.camp set value \
'[{"text":"てるてる陣営 (","color":"aqua"},{"selector":"@a[tag=team_teruteru,tag=!dummy_role,tag=!role_lost]","color":"aqua"},{"text":")","color":"aqua"}]'
data modify storage werewolf: game_result.win.cause set value \
'{"text":"てるてる陣営が裁判で裁かれる"}'


#その他各役職の結果を記録した後出力
function werewolf:.util/role_processing/result/


##ゲームフェーズを進行
function werewolf:system/phase/switch_stanby/.ini