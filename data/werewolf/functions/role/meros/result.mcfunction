##サブ結果出力コマンドを記録
execute unless data storage werewolf: {winning_camp:'villager_0'} if entity @a[team=meros] run data modify storage werewolf: game_result.win_2.camp set value \
'[{"text":"走れメロス (","color":"green"},{"selector":"@a[team=meros]","color":"green"},{"text":")","color":"green"}]'
execute unless data storage werewolf: {winning_camp:'villager_0'} if entity @a[team=meros] run data modify storage werewolf: game_result.win_2.cause set value \
'{"text":"他陣営の勝利時に自身が生存"}'
