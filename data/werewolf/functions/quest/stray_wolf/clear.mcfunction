## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/clear
tellraw @a {"text":"[システム] クエスト達成: オオカミは誰かと行動を共にするようだ"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text