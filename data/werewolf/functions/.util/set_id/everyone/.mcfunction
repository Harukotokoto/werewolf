## ID用のスコアボードをリセット
scoreboard objectives remove ID
scoreboard objectives add ID dummy
scoreboard players set #GameManager ID 0

##全員にIDを付与
execute as @a run function werewolf:.util/set_id/everyone/0