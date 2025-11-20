##サブ結果出力コマンドを記録
execute unless data storage werewolf: {winning_camp:'villager_0'} if entity @a[team=ojousama] run data modify storage werewolf: game_result.win_2.camp set value \
'[{"text":"お嬢様 (","color":"green"},{"selector":"@a[team=ojousama]","color":"green"},{"text":")","color":"green"}]'
execute unless data storage werewolf: {winning_camp:'villager_0'} if entity @a[team=ojousama] run data modify storage werewolf: game_result.win_2.cause set value \
'{"text":"他陣営の勝利時に自身が生存"}'
