##語り

execute store result score @s reserve_0 run random value 0..1

execute if score @s reserve_0 matches 0 run return run function werewolf:role/kaitou/skill/talking/start_0
execute if score @s reserve_0 matches 1 run return run function werewolf:role/kaitou/skill/talking/start_1