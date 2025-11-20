## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/clear
tellraw @a {"text":"[システム] クエスト達成: 狼は無事飼い主と合流できたようだ"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

#報酬
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] on owner run give @s emerald 7

#演出
execute as @e[type=villager,tag=wolf_owner] at @s run playsound minecraft:entity.villager.yes master @a ~ ~ ~ 1.0 1 0.0

#おかたづけ
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] at @s run particle minecraft:cloud ~0.5 ~0.5 ~0.5 1 1 1 0 5 force @a
execute as @e[type=villager,tag=wolf_owner] at @s run particle minecraft:cloud ~0.5 ~0.5 ~0.5 1 1 1 0 5 force @a

execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run data modify entity @s Owner set from entity @s UUID
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run tp @s ~ ~-1000 ~
execute as @e[type=wolf,tag=quest_wolf,tag=wimw] run kill @s
execute as @e[type=interaction,tag=quest_wolf] run kill @s

execute as @e[type=villager,tag=wolf_owner] run tp @s ~ ~-1000 ~
execute as @e[type=villager,tag=wolf_owner] run kill @s