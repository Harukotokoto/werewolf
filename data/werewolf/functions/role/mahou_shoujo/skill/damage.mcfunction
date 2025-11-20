## 演出
particle minecraft:dust{color:[0.0,0.0,0.0],scale:1.8} ~ ~ ~ 0.3 0.3 0.3 0 10 force @a
execute as @a[tag=hit_magic_bullet] run particle minecraft:dust{color:[0.0,0.0,0.0],scale:1.8} ~ ~1 ~ 0.3 0.5 0.3 1 40 force @a

## ダメージ処理
#直撃
#damage @s[tag=hit_magic_bullet] 7
effect give @s[tag=hit_magic_bullet] minecraft:blindness 3 0 true
execute at @a[tag=hit_magic_bullet,limit=1] run playsound minecraft:block.wool.place master @a ~ ~ ~ 1.0 0.65 0.0

## おかたづけ
#ヒットタグを削除
tag @s remove hit_magic_bullet
#弾をキル
kill @e[type=item,tag=magic_bullet,tag=ms,sort=nearest,limit=1]