##スコアボードに反映
# 役職が0人
#スコアボード作成
$execute if data storage werewolf: role.$(reserve_0){count:0} run return run scoreboard players reset $(reserve_0) role_list
# 役職人数をスコアボードに
$execute store result score #reserve reserve_5 run data get storage werewolf: role.$(reserve_0).count

# 役職が1人以上
$scoreboard players set $(reserve_0) role_list $(reserve_2)
# 表示名を変更
$scoreboard players display name $(reserve_0) role_list $(reserve_1)
# 人数及び陣営アイコンを反映
#scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"$(reserve_3)"}
$execute if score #reserve reserve_5 matches 1..9 run execute if data storage werewolf: role.$(reserve_0){camp:wolf} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE507\uF824$(reserve_3)"}
$execute if score #reserve reserve_5 matches 1..9 run execute if data storage werewolf: role.$(reserve_0){camp:maniac} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE508\uF824$(reserve_3)"}
$execute if score #reserve reserve_5 matches 1..9 run execute if data storage werewolf: role.$(reserve_0){camp:villager} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE509\uF824$(reserve_3)"}
$execute if score #reserve reserve_5 matches 1..9 run execute if data storage werewolf: role.$(reserve_0){camp:third} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE50A\uF824$(reserve_3)"}

$execute if score #reserve reserve_5 matches 10.. run execute if data storage werewolf: role.$(reserve_0){camp:wolf} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE507$(reserve_3)"}
$execute if score #reserve reserve_5 matches 10.. run execute if data storage werewolf: role.$(reserve_0){camp:maniac} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE508$(reserve_3)"}
$execute if score #reserve reserve_5 matches 10.. run execute if data storage werewolf: role.$(reserve_0){camp:villager} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE509$(reserve_3)"}
$execute if score #reserve reserve_5 matches 10.. run execute if data storage werewolf: role.$(reserve_0){camp:third} run scoreboard players display numberformat $(reserve_0) role_list fixed {"text":"\uF810\uE50A$(reserve_3)"}