##使用するstorageをリセット
data modify storage macro: reserve_0 set value ""
data modify storage macro: reserve_1 set value ""
##使用するデータを用意
data modify storage macro: reserve_2 set value 1
data modify storage macro: reserve_3 set value '{"text":"\\n"}'

##実行
function werewolf:role/mahou_shoujo/settings/skill/dummy_role/0 with storage macro: util.role_processing
##出力
function werewolf:role/mahou_shoujo/settings/skill/dummy_role/2 with storage macro: