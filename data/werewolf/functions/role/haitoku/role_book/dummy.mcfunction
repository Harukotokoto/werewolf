##ダミー

#be_written_haitokuの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=be_written_haitoku,tag=!role_lost,scores={ID=1..}]

## 役職本動作
#1
execute if score #GameManager reserve_0 matches ..1 run return run tellraw @s [{"text":"妖狐は居ないようだ…"}]

#2..
#偽のリストを作成
function werewolf:.util/role_processing/dummy_role_book_list/
#出力
tellraw @s [{"text":"今回の妖狐は… "},{"selector":"@s"},{"text":", "},{"interpret":true,"nbt":"reserve_2","storage":"macro:"},{"text":" のようだ。"}]