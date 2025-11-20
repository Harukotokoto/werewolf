## ランダムクエスト処理
#タイマーを減算
execute if data storage werewolf: settings.gamemode{quest:true} if data storage werewolf: gamestate.time{id:"day"} unless data storage werewolf: gamestate.quest{active:true} if score #GameManager quest_timer matches 1.. run scoreboard players remove #GameManager quest_timer 1
#クエスト発生判定
execute if data storage werewolf: settings.gamemode{quest:true} if data storage werewolf: gamestate.time{id:"day"} unless data storage werewolf: gamestate.quest{active:true} if score #GameManager quest_timer matches 0 unless score #GameManager common_timer matches ..1100 run function werewolf:.util/quest_processing/start/