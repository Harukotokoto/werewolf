##共通処理
#全員を盲目に
effect give @s blindness 3 255 true
#効果音を全てストップ
stopsound @a
#サブタイトルをセット
title @a subtitle {"text":"\uE000","font":"role_view"}
#観戦者にtitle設定
execute as @a[tag=!player] run title @s title [{"text":"\uE001","font":"role_view"}]

##実行
function werewolf:.util/role_processing/start/0 with storage macro: util.role_processing