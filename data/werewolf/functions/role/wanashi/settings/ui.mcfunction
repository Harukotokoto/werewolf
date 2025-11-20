# 処理を記述
data modify storage werewolf: settings.text append value '{"text":"　 [罠師]"}'
execute if data storage werewolf: role.wanashi.skill_2{limit:999} run data modify storage werewolf: settings.text append value '[{"text":"　   最大回数: "},{"text":"∞ 回 / 回復時間: "},{"nbt":"role.wanashi.skill_2.cooltime_second","storage":"werewolf:"},{"text":" 秒"}]'
execute unless data storage werewolf: role.wanashi.skill_2{limit:999} run data modify storage werewolf: settings.text append value '[{"text":"　   最大回数: "},{"nbt":"role.wanashi.skill_2.limit","storage":"werewolf:"},{"text":" 回 / 回復時間: "},{"nbt":"role.wanashi.skill_2.cooltime_second","storage":"werewolf:"},{"text":" 秒"}]'
execute if data storage werewolf: role.wanashi.skill_2{count:999} run data modify storage werewolf: settings.text append value '[{"text":"　   同時設置数: "},{"text":"∞ 個"}]'
execute unless data storage werewolf: role.wanashi.skill_2{count:999} run data modify storage werewolf: settings.text append value '[{"text":"　   同時設置数: "},{"nbt":"role.wanashi.skill_2.count","storage":"werewolf:"},{"text":" 個"}]'
