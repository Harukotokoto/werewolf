## 演出
execute on origin run particle minecraft:dust{color:[0.0,0.0,0.0],scale:1.8} ~ ~ ~ 0.3 0.3 0.3 0 10 force @s
execute on origin at @a[tag=hit_magic_bullet] run particle minecraft:dust{color:[0.0,0.0,0.0],scale:1.8} ~ ~1 ~ 0.3 0.5 0.3 1 40 force @s

## ダメージ処理
#直撃
execute on origin at @a[tag=hit_magic_bullet,limit=1] run playsound minecraft:block.wool.place master @s ~ ~ ~ 1.0 0.65 0.0

## おかたづけ
#ヒットタグを削除
tag @s remove hit_magic_bullet
#弾をキル
kill @e[type=item,tag=magic_bullet,tag=ms_dummy,sort=nearest,limit=1]