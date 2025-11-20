##割り込みのplaying

## bossbar管理
function werewolf:system/bossbar/time/advance/
## 役職関連
#各役職の処理
function werewolf:.util/role_processing/playing/
## アイテム関連
function werewolf:item/

##緊急裁判
#全員が投票していたら会議時間をスキップ
execute unless entity @a[tag=player,scores={can_vote=0}] if score #GameManager common_timer matches 2.. run scoreboard players set #GameManager common_timer 1
#投票を反映
execute if score #GameManager common_timer matches 0 run function werewolf:system/trial/vote_result
execute if score #GameManager common_timer matches 0 run effect give @a[tag=player,tag=hang] glowing 10 0 true
#吊られる人をtp
execute if score #GameManager common_timer matches -199..0 as @a[tag=player,tag=hang] at @s at @e[type=marker,tag=hang,sort=nearest,limit=1] run tp @s ~ ~ ~
execute if score #GameManager common_timer matches -199..0 as @a[tag=player,tag=hang] run attribute @s minecraft:generic.gravity base set 0
#会議を終了
execute if score #GameManager common_timer matches ..-100 unless entity @a[tag=player,tag=hang] run function werewolf:system/trial/end
execute if score #GameManager common_timer matches ..-200 run function werewolf:system/trial/end

## 右クリック判定リセット
scoreboard players set @a right_click 0