## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/failed
tellraw @a {"text":"[システム] クエスト失敗: 今夜のモンスター襲来に備えろ"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

##おかたづけ
tp @e[type=phantom,tag=target,tag=quest] ~ ~-1000 ~
kill @e[type=phantom,tag=target,tag=quest]
execute at @e[type=marker,tag=sky,tag=quest,tag=this] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

##ペナルティを予約
function werewolf:quest/hit_the_target/schedule
