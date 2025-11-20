# 処理を記述
execute if data storage werewolf: role.kaitou{talk:true} run data modify storage werewolf: settings.text append value '[{"text":"　 [怪盗]　　 語り: "},{"text":"有効","color":"green"}]'
execute if data storage werewolf: role.kaitou{talk:false} run data modify storage werewolf: settings.text append value '[{"text":"　 [怪盗]　　 語り: "},{"text":"無効","color":"red"}]'