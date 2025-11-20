## schedule
#夜になったらペナルティ発動
execute if data storage werewolf: gamestate.time{id:"night"} run schedule function werewolf:quest/delivery_apple/penalty 3s

#夜になるまで再帰処理
execute unless data storage werewolf: gamestate.time{id:"night"} run schedule function werewolf:quest/delivery_apple/schedule 1t