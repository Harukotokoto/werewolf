##クエストリセット
#イベントフラグ管理
data modify storage werewolf: gamestate.quest.active set value false
#クエスト詳細削除
data remove storage werewolf: gamestate.quest.text
#個別リセット
$function werewolf:quest/$(name)/reset