## リストの要素数を取得
execute store result storage macro: reserve_1 int 1 run data get storage macro: reserve_0
## 要素数が0ならreturn
execute if data storage macro: {reserve_1:0} run return fail

## 減算
execute store result storage macro: reserve_1 int 0.99999 run data get storage macro: reserve_1

## ランダムに
function werewolf:.util/quest_processing/shuffle/1 with storage macro:

## クエストを保存/削除
function werewolf:.util/quest_processing/shuffle/2 with storage macro:


## 再帰
function werewolf:.util/quest_processing/shuffle/0