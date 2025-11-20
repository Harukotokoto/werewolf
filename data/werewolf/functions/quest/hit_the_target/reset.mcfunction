## リセット
data modify storage werewolf: gamestate.quest.active set value false
schedule clear werewolf:quest/hit_the_target/penalty_0
tp @e[type=phantom,tag=target,tag=quest] ~ ~-1000 ~
kill @e[type=phantom,tag=target,tag=quest]
kill @e[tag=penalty,tag=quest]