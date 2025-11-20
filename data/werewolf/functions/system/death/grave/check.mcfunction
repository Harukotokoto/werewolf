## 墓生成のチェック
execute as @e[type=item,tag=grave,tag=not_yet,predicate=werewolf:location_check/in_liquid] run function werewolf:system/death/grave/place_0
execute as @e[type=item,tag=grave,tag=not_yet,nbt={OnGround:1b}] run function werewolf:system/death/grave/place_0