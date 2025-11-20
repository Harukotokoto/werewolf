##定期招集
execute unless entity @a[team=saibankan] unless entity @a[tag=saibankan_successor,tag=player] run return fail

execute if entity @a[team=saibankan] run data modify storage werewolf: game_state.trial.convener set value '[{"text":"裁判官"}]'
execute unless entity @a[team=saibankan] if entity @a[tag=saibankan_successor] run data modify storage werewolf: game_state.trial.convener set value '[{"text":"裁判官(後任)"}]'
data modify storage werewolf: game_state.trial.cause set value '[{"text":"役職による能力"}]'

##裁判を開廷
function werewolf:system/trial/