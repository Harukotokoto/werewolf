##wheat

##タスクの抽選漏れ
execute at @s[tag=!active_task] align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:wheat",Properties:{age:"7"}},Tags:["dummy_task"]}

##タスク場所
#タスク場所にタスクを設置
execute as @s[tag=active_task] at @s unless block ~ ~ ~ minecraft:wheat run setblock ~ ~ ~ wheat[age=7]
execute as @s[tag=active_task] at @s align xyz run summon interaction ~0.5 ~ ~0.5 {Tags:["1click_task","wheat"],width:1.1f,height:1.1f}
#タスクが見やすいようディスプレイ表示
execute as @s[tag=active_task] align xyz run summon minecraft:item_display ~0.5 ~500.5 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":100}},view_range:10f,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0.001f,-499.999f,0.001f]},brightness:{block:10,sky:10},Tags:["select_block"]}
#パーティクル表示
execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a