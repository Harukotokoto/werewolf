#タイマーを進行
scoreboard players remove #GameManager phase_switcher 1

#stanbyモード処理の流用
function werewolf:system/phase/stanby/

#3
execute if score #GameManager phase_switcher matches 60 run function werewolf:system/countdown/3
#2
execute if score #GameManager phase_switcher matches 40 run function werewolf:system/countdown/2
#1
execute if score #GameManager phase_switcher matches 20 run function werewolf:system/countdown/1




##ゲームフェイズを変更
execute if score #GameManager phase_switcher matches ..0 run function werewolf:system/phase/playing/.ini