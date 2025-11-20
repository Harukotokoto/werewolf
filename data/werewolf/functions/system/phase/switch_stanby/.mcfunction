#タイマーを進行
scoreboard players remove #GameManager phase_switcher 1

##報酬配布
execute if score #GameManager phase_switcher matches ..0 run function werewolf:.util/role_processing/reward/
##ゲーム終了関数
execute if score #GameManager phase_switcher matches ..0 run function werewolf:system/phase/end
##bossbarをリセット
execute if score #GameManager phase_switcher matches ..0 run function werewolf:system/bossbar/.reset/
execute if score #GameManager phase_switcher matches ..0 run function werewolf:.util/set_id/everyone/
execute if score #GameManager phase_switcher matches ..0 run function werewolf:system/bossbar/.ini/everyone/


##ゲームフェーズを変更
execute if score #GameManager phase_switcher matches ..0 run function werewolf:system/phase/stanby/.ini