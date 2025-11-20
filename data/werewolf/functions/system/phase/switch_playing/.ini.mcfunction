#ゲームモード変更
data modify storage werewolf: phase set value "switch_playing"

##役職構成を把握
function werewolf:.util/role_processing/teaming/
##役職振り分け不可ならstanbyに
execute if data storage macro: {reserve_0:1} run return run function werewolf:system/phase/switch_stanby/.ini

##プレイヤーを初期位置にtp
function werewolf:system/tp/start_point/everyone/

#アナウンス
#tellraw @a "switching playing..."
tellraw @a "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n[システム] 15秒後にゲームが始まります。"


#タイマーをセット(15秒)
scoreboard players set #GameManager phase_switcher 300


##再帰処理を開始
#function werewolf:system/phase/switch_playing/