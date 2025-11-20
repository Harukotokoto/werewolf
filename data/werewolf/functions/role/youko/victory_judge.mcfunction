##勝利判定
# 妖狐陣営

#1陣営全滅＋妖狐が生存
execute if data storage werewolf: winning_camp \
        if entity @e[team=youko,tag=player] \
run data modify storage werewolf: winning_camp set value "youko_0"

#妖狐(+背徳者)のみの生存
execute if entity @e[team=youko,tag=player] \
        unless entity @e[team=!youko,team=!haitoku,tag=player,tag=!no_judgment] \
run data modify storage werewolf: winning_camp set value "youko_1"


execute unless data storage werewolf: winning_camp run return fail


##結果出力
execute if data storage werewolf: {winning_camp:'youko_0'} if entity @a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost] run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"妖狐陣営 (","color":"aqua"},{"selector":"@a[tag=team_youko,tag=!dummy_role,tag=!role_lost]","color":"aqua"},{"text":", ","color":"gray"},{"selector":"@a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost],","color":"aqua"},{"text":")","color":"aqua"}]'
execute if data storage werewolf: {winning_camp:'youko_0'} unless entity @a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost] run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"妖狐陣営 (","color":"aqua"},{"selector":"@a[tag=team_youko,tag=!dummy_role,tag=!role_lost]","color":"aqua"},{"text":")","color":"aqua"}]'
execute if data storage werewolf: {winning_camp:'youko_0'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":"他陣営の勝利時に妖狐が生存"}'

execute if data storage werewolf: {winning_camp:'youko_1'} if entity @a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost] run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"妖狐陣営 (","color":"aqua"},{"selector":"@a[tag=team_youko,tag=!dummy_role,tag=!role_lost]","color":"aqua"},{"text":", ","color":"gray"},{"selector":"@a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost],","color":"aqua"},{"text":")","color":"aqua"}]'
execute if data storage werewolf: {winning_camp:'youko_1'} unless entity @a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost] run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"妖狐陣営 (","color":"aqua"},{"selector":"@a[tag=team_youko,tag=!dummy_role,tag=!role_lost]","color":"aqua"},{"text":")","color":"aqua"}]'
execute if data storage werewolf: {winning_camp:'youko_1'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":"妖狐陣営が最後まで生き残る"}'