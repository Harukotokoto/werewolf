## ヒットタグを削除
tag @s remove hit_cupid_arrow

## lovers処理
#loversの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=lovers,tag=player]
#tag付け
execute if score #GameManager reserve_0 matches ..1 run tag @s[type=player,team=!cupid,tag=!lovers] add lovers

## おかたづけ
#矢をキル
kill @e[type=item,tag=cupid_arrow,sort=nearest,limit=1]

## 演出
#loversの人数を記録
execute store result score #GameManager reserve_0 if entity @a[tag=lovers,tag=player]
#ラバーズが完成したら演出
execute if score #GameManager reserve_0 matches 2.. as @a[team=cupid] at @s run playsound minecraft:fall_in_love master @s
execute if score #GameManager reserve_0 matches 2.. as @a[tag=lovers] at @s run playsound minecraft:fall_in_love master @s
execute if score #GameManager reserve_0 matches 2.. as @a[tag=lovers] at @s run particle minecraft:heart ~ ~1.7 ~ 0.2 0.2 0.2 0 5 force @a[team=cupid]
execute if score #GameManager reserve_0 matches 2.. as @a[tag=lovers] at @s run particle minecraft:heart ~ ~1.7 ~ 0.2 0.2 0.2 0 5 force @a[tag=lovers]

execute if score #GameManager reserve_0 matches 2.. run tellraw @a[team=cupid] [{"selector":"@a[tag=lovers,tag=player,limit=1,sort=nearest]","color":"light_purple"},{"text":"と","color":"light_purple"},{"selector":"@a[tag=lovers,tag=player,limit=1,sort=furthest]","color":"light_purple"},{"text":"は恋人となった","color":"light_purple"}]
execute if score #GameManager reserve_0 matches 2.. run tellraw @a[tag=lovers] [{"selector":"@a[tag=lovers,tag=player,limit=1,sort=nearest]","color":"light_purple"},{"text":"と","color":"light_purple"},{"selector":"@a[tag=lovers,tag=player,limit=1,sort=furthest]","color":"light_purple"},{"text":"は恋人となった","color":"light_purple"}]

##完成前なら予約
execute if score #GameManager reserve_0 matches 1 run tellraw @a[team=cupid] [{"selector":"@a[tag=lovers,tag=player,limit=1,sort=nearest]","color":"light_purple"},{"text":"は誰かの恋人になりそうだ","color":"light_purple"}]