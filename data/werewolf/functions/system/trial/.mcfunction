##裁判の準備

##現在のゲームフェイズ情報を退避
data modify storage werewolf: gamestate.time_save.id set from storage werewolf: gamestate.time.id
data modify storage werewolf: gamestate.time_save.text set from storage werewolf: gamestate.time.text
data modify storage werewolf: gamestate.day_count_save.text set from storage werewolf: gamestate.day_count.text
execute store result storage werewolf: gamestate.time_save.timer int 1 run scoreboard players get #GameManager common_timer

##裁判フェイズに以降
execute store result score #GameManager common_timer run data get storage werewolf: settings.time.trial.tick
function werewolf:system/bossbar/time/reload/
data modify storage werewolf: gamestate.time.id set value "trial"
data modify storage werewolf: gamestate.time.text set value '{"text":"緊急裁判","color":"white"}'
data modify storage werewolf: gamestate.day_count.text set value ""

##全員を裁判室へtp
execute as @a at @s run tp @s @e[type=marker,tag=courtroom,limit=1,sort=nearest]

##裁判用scoreboardをリセット
scoreboard players set @a votes 0
scoreboard players set @a[tag=player] can_vote 0

scoreboard players set #GameManager votes 0
scoreboard players set #GameManager vote_skip 0

##裁判中は静粛に。
#エフェクトをリセット
effect clear @a
#耐性を付与
effect give @a resistance infinite 255 true
#餓死防止のための難易度変更
difficulty easy

##墓をキル
execute if data storage werewolf: settings.trial{delete_grave:true} run kill @e[tag=grave]

##投票用チャットを表示
schedule function werewolf:system/trial/vote_chat_0 5s

##緊急会議の演出
title @a title [{"text":"\uE000","font":"announce"}]
execute as @a at @s run playsound minecraft:start_trial master @s