## 演出
particle minecraft:dust{color:[0.0,0.0,0.0],scale:1.8} ~ ~ ~ 0.3 0.3 0.3 0 5 force @a
particle minecraft:explosion
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 0.2

## ダメージ処理
#直撃
damage @s[tag=hit_magic_bullet] 7
#爆発
execute at @e[type=item,tag=magic_bullet,tag=fire,sort=nearest,limit=1] positioned ~-1.5 ~-1.5 ~-1.5 as @e[dx=3,dy=3,dz=3] run damage @s[tag=!hit_magic_bullet] 3

## おかたづけ
#ヒットタグを削除
tag @s remove hit_magic_bullet
#弾をキル
kill @e[type=item,tag=magic_bullet,tag=fire,sort=nearest,limit=1]