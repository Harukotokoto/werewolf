## 死亡検知用のaec
execute as @s[tag=!hang] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Tags:["death_announce"]}
data modify entity @e[type=area_effect_cloud,tag=death_announce,limit=1,sort=nearest] Owner set from entity @s UUID


## 役職ごとの処理
##狼
# 罠師
#落とし穴のスコアリセット
scoreboard players reset @s fall_into_a_pitfall
##村
# 騎士
#騎士の護りフェイズ進行
function werewolf:role/kishi/skill/death_0
# リーダー
execute if entity @s[team=charisma,tag=!no_ability_activation] run function werewolf:role/charisma/skill/death
# 猫又
execute if entity @s[team=nekomata,tag=hang] run function werewolf:role/nekomata/skill/death
# キューピット
execute if entity @s[tag=lovers] run function werewolf:role/cupid/skill/death
##第三
# てるてる
execute if entity @s[team=teruteru,tag=hang] run return run function werewolf:role/teruteru/skill/death


## 共通処理-1
# 裁判
#緊急会議用に死亡したプレイヤーを一時保存
execute at @s run function werewolf:.util/get_name/
data modify storage werewolf: game_state.trial.dead append from storage macro: reserve_0

# 流出アイテムをキル
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["no_drop"]}}}}]
# 墓を召喚する準備
execute at @s run function werewolf:system/death/grave/

## 割り込みで復活処理
execute if entity @s[team=mahou_shoujo,tag=camp_villager,tag=!role_lost,tag=!hang] at @s run return run function werewolf:role/mahou_shoujo/skill/change_camp


## 共通処理-2
#hangタグ削除
tag @s remove hang
#playerタグを削除
tag @s remove player
# 死亡時に天界へ送る
team join _heaven
gamemode spectator @s
#死亡地点付近のstart_pointをリスポーンポイントに
#execute as @s at @e[type=marker,tag=start_point,limit=1,sort=nearest] run spawnpoint @s ~ ~ ~
# 死亡カウントをリセット
scoreboard players set @s death 0


## ランダムクエスト処理
# ペットの狼処理
function werewolf:quest/stray_wolf/death_owner

##演出
#title
title @s times 0s 3.5s 1s
execute as @s run title @s subtitle [{"text":"\uE100","font":"announce"}]
execute as @s run title @s title [{"text":"\uE101","font":"announce"}]