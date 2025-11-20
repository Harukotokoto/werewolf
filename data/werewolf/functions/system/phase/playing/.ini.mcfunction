#ゲームモード変更
data modify storage werewolf: phase set value "playing"

#アイテムをクリア
clear @a

##ゲームスタート関数
function werewolf:system/phase/start