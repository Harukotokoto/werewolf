##勝利判定
# 死神陣営

#死神のみの生存
execute if entity @e[team=shinigami] \
        unless entity @e[team=!shinigami,tag=player,tag=!no_judgment] \
run data modify storage werewolf: winning_camp set value "shinigami_0"


execute unless data storage werewolf: winning_camp run return fail


##結果出力
execute if data storage werewolf: {winning_camp:'shinigami_0'} run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"死神陣営 (","color":"aqua"},{"selector":"@a[tag=team_shinigami,tag=!dummy_role,tag=!role_lost]","color":"aqua"},{"text":")","color":"aqua"}]'
execute if data storage werewolf: {winning_camp:'shinigami_0'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":"死神陣営が最後まで生き残る"}'