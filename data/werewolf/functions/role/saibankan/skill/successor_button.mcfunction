advancement revoke @s only werewolf:interacted_with_entity/skill/saibankan/trial_button

##return
#クエスト中
execute if data storage werewolf: gamestate.quest{active:true} run return fail
#特定アイテム使用中
execute if data storage werewolf: gamestate.item{active:true} run return fail
#ボタン使用済み
execute if entity @s[scores={trial_button=1..}] run return fail
#裁判官生存
execute if entity @a[team=saibankan] run return fail

##裁判準備
data modify storage werewolf: game_state.trial.convener set value '[{"text":"裁判官(後任)"}]'
data modify storage werewolf: game_state.trial.cause set value '[{"text":"役職による能力"}]'

##ボタンを制限
scoreboard players set @s trial_button 1

##裁判を開廷
function werewolf:system/trial/




