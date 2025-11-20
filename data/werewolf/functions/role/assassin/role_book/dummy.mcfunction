##ダミー

#be_written_jinrouの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=be_written_jinrou,tag=!role_lost,scores={ID=1..}]
#自分を除いた人数に調節
scoreboard players remove #GameManager reserve_0 1

## 役職本動作
#1
execute if score #GameManager reserve_0 matches ..0 run return run tellraw @s [{"text":"あなた以外に人狼は居ないようだ…"}]

#2..
#偽のリストを作成
function werewolf:.util/role_processing/dummy_role_book_list/
#出力
tellraw @s [{"text":"今回の人狼は… "},{"selector":"@s"},{"text":", "},{"interpret":true,"nbt":"reserve_2","storage":"macro:"},{"text":" のようだ。"}]