##緊急裁判を閉廷

#エフェクトをリセット
effect clear @a

#難易度を元に戻す
difficulty hard

#処刑対象のキル処理
execute as @a[tag=player,tag=hang] run function werewolf:system/death/

#死亡者リストを更新
data remove storage werewolf: game_state.trial.dead

#プレイヤーをフィールドへtp
function werewolf:system/set_player/

##裁判フェイズから戻す
execute if data storage werewolf: gamestate.time_save{id:"day"} run execute store result score #GameManager common_timer run data get storage werewolf: settings.time.day.tick
execute if data storage werewolf: gamestate.time_save{id:"night"} run execute store result score #GameManager common_timer run data get storage werewolf: settings.time.night.tick
function werewolf:system/bossbar/time/reload/
data modify storage werewolf: gamestate.time.id set from storage werewolf: gamestate.time_save.id
data modify storage werewolf: gamestate.time.text set from storage werewolf: gamestate.time_save.text
data modify storage werewolf: gamestate.day_count.text set from storage werewolf: gamestate.day_count_save.text
execute store result score #GameManager common_timer run data get storage werewolf: gamestate.time_save.timer