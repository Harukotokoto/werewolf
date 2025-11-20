## 投票結果
#投票していない人をスキップに強制投票
execute as @a[tag=player,scores={can_vote=0}] run function werewolf:system/trial/vote_skip

#投票結果を表示-1
tellraw @a "\n\n\n\n\n\n\n\n\n\n\n\n\n\n[投票結果]"
execute as @a[tag=player] run tellraw @a [{"selector":"@s"},{"text":" "},{"score":{"name":"@s","objective":"votes"},"color":"white"},{"text":"票"}]
tellraw @a [{"text":"投票スキップ "},{"score":{"name":"#GameManager","objective":"votes"},"color":"white"},{"text":"票"}]

#誰が吊り対象か判定
function werewolf:system/trial/hang_check

#投票結果を表示-2
execute if entity @a[tag=player,tag=hang] if score #GameManager reserve_1 matches 1 run tellraw @a [{"text":"\n"},{"selector":"@a[tag=player,tag=hang]","color":"red"},{"text":" "},{"text":"が処刑されます","color":"red"}]
execute if entity @a[tag=player,tag=hang] unless score #GameManager reserve_1 matches 1 run tellraw @a [{"text":"\n"},{"selector":"@a[tag=player,tag=hang]","color":"red"},{"text":" "},{"text":"が処刑されます(ランダム)","color":"red"}]
execute unless entity @a[tag=player,tag=hang] run tellraw @a [{"text":"\n"},{"text":"今回は誰も処刑されません","color":"green"}]