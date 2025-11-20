##全員の独自のbossbarを進行


##数値を代入
$execute store result bossbar personal_$(reserve_0) value run scoreboard players get #GameManager common_timer
##表示を更新
$bossbar set personal_$(reserve_0) name \
[\
    {"score":{"name": "@a[scores={ID=$(reserve_0)}]","objective":"bossbar_negative"},"font":"bossbar_adjustment_0"},\
    {"interpret":true,"nbt":"gamestate.quest.text[0]","storage":"werewolf:","font":"game_stat_0"},\ 
    {"interpret":true,"nbt":"gamestate.quest.text[1]","storage":"werewolf:","font":"game_stat_0"},\
    {"interpret":true,"nbt":"gamestate.quest.text[1]","storage":"werewolf:","font":"game_stat_negative"},\
    {"interpret":true,"nbt":"gamestate.quest.text[2]","storage":"werewolf:","font":"game_stat_1"},\
    {"interpret":true,"nbt":"gamestate.quest.text[2]","storage":"werewolf:","font":"game_stat_negative"},\
    {"interpret":true,"nbt":"gamestate.quest.text[3]","storage":"werewolf:","font":"game_stat_2"},\
    {"interpret":true,"nbt":"gamestate.quest.text[3]","storage":"werewolf:","font":"game_stat_negative"},\
    {"interpret":true,"nbt":"gamestate.quest.text[4]","storage":"werewolf:","font":"game_stat_3"},\
    {"interpret":true,"nbt":"gamestate.quest.text[4]","storage":"werewolf:","font":"game_stat_negative"},\
    {"interpret":true,"nbt":"gamestate.quest.text[5]","storage":"werewolf:","font":"game_stat_0"},\
    {"score":{"name": "@a[scores={ID=$(reserve_0)}]","objective":"bossbar_negative"},"font":"bossbar_adjustment_1"},\
    \
    {"interpret":true,"nbt":"gamestate.time.text","storage":"werewolf:","font":"default_negative"},\
    {"interpret":true,"nbt":"gamestate.day_count.text","storage":"werewolf:","font":"default_negative"},\
    {"interpret":true,"nbt":"gamestate.time.text","storage":"werewolf:","font":"default"},\
    {"interpret":true,"nbt":"gamestate.day_count.text","storage":"werewolf:","font":"default"},\
    {"interpret":true,"nbt":"gamestate.time.text","storage":"werewolf:","font":"default_negative"},\
    {"interpret":true,"nbt":"gamestate.day_count.text","storage":"werewolf:","font":"default_negative"}\
]

##再帰回数を減算
execute store result storage macro: reserve_0 int 0.99999 run data get storage macro: reserve_0


##中断処理
execute if data storage macro: {reserve_0:0} run return fail
##再帰処理
function werewolf:system/bossbar/time/advance/0 with storage macro:
