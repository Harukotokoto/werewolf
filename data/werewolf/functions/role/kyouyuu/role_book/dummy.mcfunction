##ダミー

#be_written_kyouyuuの人数を記録
execute store result score #GameManager reserve_0 if entity @e[tag=be_written_kyouyuu,tag=!role_lost,scores={ID=1..}]
#自分を除いた人数に調節
scoreboard players remove #GameManager reserve_0 1

## 役職本動作
#1
execute if score #GameManager reserve_0 matches ..1 run return run tellraw @s [{"text":"あなた以外に共有者は居ないようだ…"}]

#2..
#偽のリストを作成
function werewolf:.util/role_processing/dummy_role_book_list/
#出力
tellraw @s [{"text":"今回の共有者は… "},{"selector":"@s"},{"text":", "},{"interpret":true,"nbt":"reserve_2","storage":"macro:"},{"text":" のようだ。"}]