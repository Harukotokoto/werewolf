##サブ結果出力コマンドを記録
execute if entity @a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost] run data modify storage werewolf: game_result.sub append value \
'[{"text":"<背徳者>  ","color":"aqua"},{"selector":"@a[tag=team_haitoku,tag=!dummy_role,tag=!role_lost]","color":"aqua"}]'


execute if data storage werewolf: {winning_camp:'youko_0'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"3","font":"result"}'
execute if data storage werewolf: {winning_camp:'youko_1'} run data modify storage werewolf: game_result.output.title set value 'title @a title {"text":"3","font":"result"}'