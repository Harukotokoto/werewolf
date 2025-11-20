##diamond_ore

##タスクの抽選漏れ
execute as @s[tag=!active_task] run setblock ~ ~ ~ stone
execute as @s[tag=!active_task] align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {item:{id:"minecraft:stone",Count:1b},Tags:["dummy_task"]}

##タスク場所
#タスク場所にタスクを設置
execute as @s[tag=active_task] unless block ~ ~ ~ minecraft:diamond_ore run setblock ~ ~ ~ minecraft:diamond_ore
#タスクが見やすいようディスプレイ表示
execute as @s[tag=active_task] align xyz run summon minecraft:item_display ~0.5 ~500.5 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":101}},view_range:10f,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0.001f,-499.999f,0.001f]},brightness:{block:10,sky:10},Tags:["select_block"]}
#スイッチャーを設置
execute as @s[tag=active_task] align xyz positioned ~0.5 ~-0.0001 ~0.5 run summon interaction ~ ~ ~ {Tags:["task_switcher"],width:1.001f,height:1.001f}
#パーティクル表示
execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

