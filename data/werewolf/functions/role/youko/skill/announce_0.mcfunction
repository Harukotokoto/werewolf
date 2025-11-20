## 視線上のプレイヤーを厳密に検知
function werewolf:.util/eye_detection/player/

## プレイヤー検知に失敗したならreturn
execute unless data storage macro: reserve_0 run return fail

## アナウンス
function werewolf:role/youko/skill/announce_1 with storage macro: