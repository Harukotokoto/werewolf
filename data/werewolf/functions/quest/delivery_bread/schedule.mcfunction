## schedule
#夜になったらペナルティ発動
execute if data storage werewolf: gamestate.time{id:"night"} run schedule function werewolf:quest/delivery_bread/penalty 3s

#夜になるまで再帰処理
execute unless data storage werewolf: gamestate.time{id:"night"} run schedule function werewolf:quest/delivery_bread/schedule 1t