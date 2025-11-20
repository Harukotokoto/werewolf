## リセット
data modify storage werewolf: gamestate.quest.active set value false
schedule clear werewolf:quest/security_up/schedule
execute at @e[type=marker,tag=delivery_box] align xyz run setblock ~ ~ ~ air replace
kill @e[type=interaction,tag=delivery_box]
kill @e[type=text_display,tag=delivery_box]
kill @e[type=item_display,tag=delivery_box]