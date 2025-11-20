##語り

#連続防止
execute if score @s talk_kaitou matches ..150 run return fail

#ランダム
execute store result score @s reserve_0 run random value 0..4000

execute if score @s reserve_0 matches 0 run return run function werewolf:role/kaitou/skill/talking/nomal_0
execute if score @s reserve_0 matches 1 run return run function werewolf:role/kaitou/skill/talking/nomal_1
execute if score @s reserve_0 matches 2 run return run function werewolf:role/kaitou/skill/talking/nomal_2
execute if score @s reserve_0 matches 3 run return run function werewolf:role/kaitou/skill/talking/nomal_3
execute if score @s reserve_0 matches 4 run return run function werewolf:role/kaitou/skill/talking/nomal_4
execute if score @s reserve_0 matches 5 run return run function werewolf:role/kaitou/skill/talking/nomal_5