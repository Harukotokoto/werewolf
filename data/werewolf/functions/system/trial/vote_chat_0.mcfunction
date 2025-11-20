## 投票チャット
tellraw @a "\n\n\n\n\n\n\n\n\n\n\n\n\n\n[緊急裁判]"
tellraw @a [{"interpret":true,"nbt":"game_state.trial.convener","storage":"werewolf:"},{"text":"が招集"}]
tellraw @a [{"text":"招集方法: "},{"interpret":true,"nbt":"game_state.trial.cause","storage":"werewolf:"}]
execute unless data storage werewolf: game_state.trial.dead run tellraw @a [{"text":"新たな死亡プレイヤー: "},{"text":"なし","color":"green"}]
execute if data storage werewolf: game_state.trial.dead run tellraw @a [{"text":"新たな死亡プレイヤー: "},{"interpret":true,"nbt":"game_state.trial.dead[]","storage":"werewolf:","color":"red"}]

## 生存プレイヤー用投票ボタン
execute as @a[tag=player] run function werewolf:system/trial/vote_chat_1
## スキップ
execute if data storage werewolf: settings.trial{must_hang:false} run tellraw @a[tag=player] [{"text":" <投票をスキップ> ","color":"green","clickEvent":{"action":"run_command","value":"/function werewolf:system/trial/vote_skip"}}]

## 不要となったデータをおかたづけ
data remove storage werewolf: game_state.trial.convener
data remove storage werewolf: game_state.trial.cause
data remove storage werewolf: game_state.trial.dead