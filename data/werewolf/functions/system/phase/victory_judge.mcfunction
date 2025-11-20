##勝利判定
#狼陣営
execute if entity @e[tag=player,tag=camp_wolf] \
        unless entity @e[tag=player,tag=camp_villager,tag=!no_judgment] \
        unless entity @e[tag=player,tag=camp_third,tag=!no_judgment] \
run data modify storage werewolf: winning_camp set value "wolf_0"

#村陣営
execute if entity @e[tag=player,tag=camp_villager] \
        unless entity @e[tag=player,tag=camp_wolf,tag=!no_judgment] \
        unless entity @e[tag=player,tag=camp_third,tag=!no_judgment] \
run data modify storage werewolf: winning_camp set value "villager_0"

#狂人
execute if entity @e[tag=player,tag=camp_maniac] \
        unless entity @e[tag=player,tag=camp_wolf,tag=!no_judgment] \
        unless entity @e[tag=player,tag=camp_villager,tag=!no_judgment] \
        unless entity @e[tag=player,tag=camp_third,tag=!no_judgment] \
run data modify storage werewolf: winning_camp set value "maniac_0"

#その他例外的な勝利判定(同時に結果出力)
function werewolf:.util/role_processing/victory_judge/

#引き分け
execute unless entity @e[tag=player] run data modify storage werewolf: winning_camp set value "draw"


##勝利陣営がいない場合はreturn
execute unless data storage werewolf: winning_camp run return fail


##結果出力
#狼陣営
execute if data storage werewolf: {winning_camp:'wolf_0'} run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"狼陣営 (","color":"red"},{"selector":"@a[tag=!camp_villager,tag=!camp_third]","color":"red"},{"text":")","color":"red"}]'
execute if data storage werewolf: {winning_camp:'wolf_0'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":"狼陣営が最後まで生き残る"}'
execute if data storage werewolf: {winning_camp:'wolf_0'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"0","font":"result"}'
#村陣営
execute if data storage werewolf: {winning_camp:'villager_0'} run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"村陣営 (","color":"green"},{"selector":"@a[tag=!camp_wolf,tag=!camp_maniac,tag=!camp_third]","color":"green"},{"text":")","color":"green"}]'
execute if data storage werewolf: {winning_camp:'villager_0'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":"村陣営が最後まで生き残る"}'
execute if data storage werewolf: {winning_camp:'villager_0'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"1","font":"result"}'
#狂人
execute if data storage werewolf: {winning_camp:'maniac_0'} run data modify storage werewolf: game_result.win.camp set value \
'[{"text":"狂人 (","color":"red"},{"selector":"@a[tag=!camp_wolf,tag=!camp_villager,tag=!camp_third]","color":"red"},{"text":")","color":"red"}]'
execute if data storage werewolf: {winning_camp:'maniac_0'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":"狂人のみが最後まで生き残る"}'
execute if data storage werewolf: {winning_camp:'maniac_0'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"2","font":"result"}'
#ドロー
execute if data storage werewolf: {winning_camp:'draw'} run data modify storage werewolf: game_result.win.camp set value \
'[{"text":" - ","color":"white"}]'
execute if data storage werewolf: {winning_camp:'draw'} run data modify storage werewolf: game_result.win.cause set value \
'{"text":" - "}'
execute if data storage werewolf: {winning_camp:'draw'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"Z","font":"result"}'

#その他各役職の結果を記録した後出力
function werewolf:.util/role_processing/result/


##ゲームフェーズを進行
function werewolf:system/phase/switch_stanby/.ini