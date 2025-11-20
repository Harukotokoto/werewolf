## イベント終了処理
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
scoreboard players set #GameManager quest_timer -1
#アナウンス
execute as @a run function werewolf:asset/title/quest/failed
tellraw @a {"text":"[システム] クエスト失敗: ウーパールーパー達はひっそりと居なくなった…"}
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text

## おかたづけ
tp @e[type=axolotl,tag=quest_axolotl,tag=quest] ~ ~-1000 ~
kill @e[type=axolotl,tag=quest_axolotl,tag=quest]
kill @e[type=interaction,tag=quest_axolotl,tag=boss,tag=quest]