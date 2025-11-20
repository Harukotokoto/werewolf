## 演出
particle heart ~ ~1 ~ 0.3 0.3 0.3 0 3 force @a
## ダメージ処理
#直撃
effect give @s minecraft:instant_health 1 0 true

## おかたづけ
#ヒットタグを削除
tag @s remove hit_magic_bullet
#弾をキル
kill @e[type=item,tag=magic_bullet,tag=heal,sort=nearest,limit=1]