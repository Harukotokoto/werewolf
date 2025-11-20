##勝利判定
#狼陣営
#execute if entity @e[team=!_spectator,tag=camp_wolf] \
#        unless entity @e[team=!_spectator,tag=camp_villager] \
#        unless entity @e[team=!_spectator,tag=camp_third] \
#run data modify storage werewolf: winning_camp set value "wolf_0"

##結果出力
#execute if data storage werewolf: {winning_camp:'wolf_0'} run data modify storage werewolf: game_result.win.camp set value \
#'[{"text":"狼陣営 (","color":"red"},{"selector":"@a[tag=camp_wolf]","color":"red"},{"text":")","color":"red"}]'
#execute if data storage werewolf: {winning_camp:'wolf_0'} run data modify storage werewolf: game_result.win.cause set value \
#'{"text":"狼陣営が最後まで生き残る"}'