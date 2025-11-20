## 実行するクエストを保存
$data modify storage werewolf: gamestate.quest.name set value "$(reserve_0)"
## 実行
$function werewolf:quest/$(reserve_0)/.ini