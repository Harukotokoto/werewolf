## ダイヤモンドチェック
# ダイヤモンドを2個以上持っているか確認
execute store result score @s reserve_0 run clear @s diamond 0

## ダイヤモンドが2個未満ならエラー
execute if score @s reserve_0 matches ..1 run return run function werewolf:role/kyoujin/skill/.error

## ダイヤモンドを2個消費
clear @s diamond 2

## スキル実行
function werewolf:role/kyoujin/skill/main_1

