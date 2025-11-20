##サブ結果出力コマンドを記録
execute if entity @a[tag=lovers] run data modify storage werewolf: game_result.sub append value \
'[{"text":"<恋人>  ","color":"aqua"},{"selector":"@a[tag=lovers]","color":"aqua"}]'

execute if data storage werewolf: {winning_camp:'cupid_0'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"5","font":"result"}'
execute if data storage werewolf: {winning_camp:'cupid_1'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"5","font":"result"}'