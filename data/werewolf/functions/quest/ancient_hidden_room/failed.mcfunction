## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/failed
tellraw @a {"text":"[システム] クエスト失敗: 不思議な力は消え去ったようだ…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

##おかたづけ
data modify entity @e[type=minecraft:item_display,tag=ice_sword,limit=1] Glowing set value false