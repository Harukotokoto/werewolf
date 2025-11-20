## 人狼陣営のプレイヤー名を表示

## スキル使用者を特定するためのtag付与
tag @s add using_kyoujin_skill

## タイトル表示
tellraw @s ["",{"text":"====================","color":"gold","bold":true}]
tellraw @s ["",{"text":"[人狼探知]","color":"gold","bold":true}]
tellraw @s ["",{"text":"人狼陣営のプレイヤー:","color":"white"}]

## 人狼陣営を表示
execute as @a[tag=camp_wolf] run tellraw @a[tag=using_kyoujin_skill] ["",{"text":"  - ","color":"gray"},{"selector":"@s","color":"red"}]

## フッター表示
tellraw @a[tag=using_kyoujin_skill] ["",{"text":"====================","color":"gold","bold":true}]

## 効果音
execute as @a[tag=using_kyoujin_skill] at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 2

## システムメッセージ
tellraw @a[tag=using_kyoujin_skill] ["",{"text":"[システム] ","color":"gold","bold":true},{"text":"ダイヤモンド×2を消費しました","color":"white"}]

## tag削除
tag @a[tag=using_kyoujin_skill] remove using_kyoujin_skill

