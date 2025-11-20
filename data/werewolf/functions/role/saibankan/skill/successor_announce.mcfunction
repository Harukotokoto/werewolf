## 緊急裁判ボタンのアナウンス

#ボタン使用済み
execute if entity @s[scores={trial_button=1..}] run return run title @s actionbar [{"text":"あなたは既に緊急裁判を招集している"}]
#裁判官生存
execute if entity @a[team=saibankan] run return run title @s actionbar [{"text":"今は緊急裁判を招集できない"}]
#クエスト中
execute if data storage werewolf: gamestate.quest{active:true} run return run title @s actionbar [{"text":"今は緊急裁判を招集できない"}]
#特定アイテム使用中
execute if data storage werewolf: gamestate.item{active:true} run return run title @s actionbar [{"text":"今は緊急裁判を招集できない"}]


title @s actionbar [{"text":"緊急裁判を招集する (右クリック)"}]