## リセット
data modify storage werewolf: gamestate.quest.active set value false

#落盤エンティティをキル
function animated_java:cave_in/remove/all
execute as @e[type=slime,tag=closure] at @s run tp ~ ~-1000 ~
kill @e[type=slime,tag=closure]