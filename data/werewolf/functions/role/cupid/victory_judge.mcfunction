##勝利判定
# キューピット陣営

#loversの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=lovers,tag=player]

#1陣営全滅＋ラバーズが生存
execute if data storage werewolf: winning_camp \
        if score #GameManager reserve_0 matches 2 \
run data modify storage werewolf: winning_camp set value "cupid_0"

#ラバーズ2人生存＋キューピット以外の生存者がいない
execute if score #GameManager reserve_0 matches 2 \
        unless entity @e[team=!cupid,tag=!lovers,tag=!no_judgment,tag=player] \
run data modify storage werewolf: winning_camp set value "cupid_0"

#キューピットのみの生存
#execute if entity @e[team=cupid] \
#        unless entity @e[team=!cupid,tag=!no_judgment,tag=player] \
#run data modify storage werewolf: winning_camp set value "cupid_1"


execute unless data storage werewolf: winning_camp run return fail


##結果出力
execute if data storage werewolf: {winning_camp:'cupid_0'} run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"恋人陣営 (","color":"aqua"},{"selector":"@a[tag=team_cupid,tag=!dummy_role,tag=!role_lost]","color":"aqua"},{"text":", ","color":"gray"},{"selector":"@a[tag=lovers],","color":"aqua"},{"text":")","color":"aqua"}]'
execute if data storage werewolf: {winning_camp:'cupid_0'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":"恋人2人が最後まで生き残る"}'

#execute if data storage werewolf: {winning_camp:'cupid_1'} run data modify storage werewolf: game_result.win.camp set value \
#'[{"text":"恋人陣営 (","color":"aqua"},{"selector":"@a[team=cupid]","color":"aqua"},{"text":")","color":"aqua"}]'
#execute if data storage werewolf: {winning_camp:'cupid_1'} run data modify storage werewolf: game_result.win.cause set value \
#'{"text":"キューピットが最後まで生き残る"}'