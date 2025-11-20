## 演出
particle minecraft:dust{color:[0.0,0.0,0.0],scale:1.8} ~ ~ ~ 0.3 0.3 0.3 0 5 force @a

## ダメージ処理
#直撃
damage @s[tag=hit_magic_bullet] 5

## おかたづけ
#ヒットタグを削除
tag @s remove hit_magic_bullet
#弾をキル
kill @e[type=item,tag=magic_bullet,tag=thunder,sort=nearest,limit=1]