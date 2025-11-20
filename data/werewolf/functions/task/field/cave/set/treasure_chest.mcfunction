##treasure_chest

##タスクの抽選漏れ

##タスク場所
#タスク場所にタスクを設置
execute as @s[tag=active_task] at @s run summon minecraft:interaction ~ ~ ~ {Tags:["1click_task","treasure_chest"],width:0.6f,height:0.6f}
execute as @s[tag=active_task] at @s run function animated_java:treasure_chest/summon
#パーティクル表示
execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a