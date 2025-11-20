## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/clear
tellraw @a {"text":"[システム] クエスト達成: 水晶は無事輝きを取り戻した"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text


##おかたづけ
#納品箱
execute at @e[type=interaction,tag=delivery_box] run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
execute at @e[type=marker,tag=delivery_box] align xyz run setblock ~ ~ ~ air replace
kill @e[type=interaction,tag=delivery_box]
kill @e[type=text_display,tag=delivery_box]
kill @e[type=item_display,tag=delivery_box]

#水晶
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["quest","crystal"]}}}}] at @s run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["quest","crystal"]}}}}] run kill @s