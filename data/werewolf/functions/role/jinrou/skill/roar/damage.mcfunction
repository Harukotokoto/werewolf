## 演出
particle minecraft:explosion ~ ~1 ~ 1 1 1 0 3 force @a

## ヒットタグを削除
tag @s remove hit_roar

## ダメージ処理
execute as @e[type=item,tag=roar,sort=nearest,limit=1] on origin run tag @s add this
damage @s[type=!player] 100 werewolf:skill
damage @s[type=player] 0.01 werewolf:skill by @a[tag=this,sort=nearest,limit=1]

## おかたづけ
#ダメージ実行者のタグ削除
execute as @e[type=item,tag=roar,sort=nearest,limit=1] on origin run tag @s remove this
#咆哮をキル
kill @e[type=item,tag=roar,sort=nearest,limit=1]