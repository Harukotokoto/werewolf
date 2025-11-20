##スコアボードに反映
# 役職が0人
execute unless entity @a[team=mura] run return fail

# 役職が1人以上
#役職人数をスコアボードに
execute store result score #reserve reserve_5 if entity @a[team=mura]

#sidebarをアクティブに
$scoreboard players set mura role_list $(reserve_0)
#表示名を変更
$scoreboard players display name mura role_list $(reserve_1)
#人数及び陣営アイコンを反映
$execute if score #reserve reserve_5 matches 1..9 run execute run scoreboard players display numberformat mura role_list fixed {"text":"\uF810\uE509\uF824$(reserve_2)"}
$execute if score #reserve reserve_5 matches 10.. run execute run scoreboard players display numberformat mura role_list fixed {"text":"\uF810\uE509$(reserve_2)"}
#村人処理を追加
#data modify storage werewolf: active_role_list append value "mura"
