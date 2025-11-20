##5ブロック先までの視線上のIDを取得(output macro:reserve_0)

## 距離のスコアボードをリセット
scoreboard players reset @s reserve_0
## storageをリセット
data remove storage macro: reserve_0

## 実行者を記録
tag @s add executor

## 視線検知
execute as @s at @s anchored eyes positioned ^ ^ ^ run function werewolf:.util/eye_detection/mobs/0

## 検知されたエンティティが実行
execute as @e[tag=this,sort=nearest,limit=1] run tag @s add target

## おかたづけ
tag @a remove executor
tag @e remove this

##直後に必ずtarget tagを削除！