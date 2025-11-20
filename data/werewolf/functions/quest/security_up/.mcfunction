## 時間管理
scoreboard players remove #GameManager quest_timer 1
scoreboard players remove #GameManager quest_bar_timer 1
execute if score #GameManager quest_bar_timer matches 0 run function werewolf:.util/quest_processing/bar/

##クエスト処理
#actionbar
execute as @a[predicate=werewolf:look_at/quest/object,nbt={Inventory:[{id:"minecraft:emerald"}]}] run title @s actionbar [{"text":"納品する (右クリック)"},{"text":" [残り:"},{"nbt":"gamestate.quest.count","storage":"werewolf:"},{"text":"個]"}]
execute as @a[predicate=werewolf:look_at/quest/object,nbt=!{Inventory:[{id:"minecraft:emerald"}]}] run title @s actionbar [{"text":" [残り納品数:"},{"nbt":"gamestate.quest.count","storage":"werewolf:"},{"text":"個]"}]


## イベント終了処理
#成功
execute if score #GameManager quest_timer matches 0.. if data storage werewolf: gamestate.quest{count:0} run return run function werewolf:quest/security_up/clear
#失敗
execute if score #GameManager quest_timer matches 0 run return run function werewolf:quest/security_up/failed


## 再帰処理
execute if data storage werewolf: gamestate.quest{active:true} run schedule function werewolf:quest/security_up/ 1t