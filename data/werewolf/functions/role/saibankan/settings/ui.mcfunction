# 処理を記述
data modify storage werewolf: settings.text append value '{"text":"　 [裁判官]"}'
data modify storage werewolf: settings.text append value '[{"text":"　   裁判時間: "},{"nbt":"settings.time.trial.second","storage":"werewolf:"},{"text":" 秒"}]'
execute if data storage werewolf: settings.trial{must_hang:false} run data modify storage werewolf: settings.text append value '[{"text":"　   吊りスキップ: "},{"text":"有効","color":"green"}]'
execute if data storage werewolf: settings.trial{must_hang:true} run data modify storage werewolf: settings.text append value '[{"text":"　   吊りスキップ: "},{"text":"無効","color":"red"}]'
execute if data storage werewolf: settings.trial{delete_grave:true} run data modify storage werewolf: settings.text append value '[{"text":"　   裁判後の墓消滅: "},{"text":"有効","color":"green"}]'
execute if data storage werewolf: settings.trial{delete_grave:false} run data modify storage werewolf: settings.text append value '[{"text":"　   裁判後の墓消滅: "},{"text":"無効","color":"red"}]'