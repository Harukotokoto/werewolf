## ヒットタグを削除
tag @s remove hit_cupid_arrow_dummy

## lovers処理
tag @s[type=player,team=!cupid] add lovers_dummy

## 演出
execute if entity @a[tag=lovers_dummy] as @e[type=item,tag=cupid_arrow_dummy,sort=nearest,limit=1] on origin run tellraw @s [{"selector":"@a[tag=lovers_dummy,tag=player,limit=1,sort=nearest]","color":"light_purple"},{"text":"は誰かの恋人になりそうだ","color":"light_purple"}]

## おかたづけ
#矢をキル
kill @e[type=item,tag=cupid_arrow_dummy,sort=nearest,limit=1]
#タグ削除
tag @a remove lovers_dummy