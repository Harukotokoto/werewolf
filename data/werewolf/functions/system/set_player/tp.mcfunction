#tpが余っていなければランダムにかぶせる
execute unless entity @e[type=marker,tag=no_tp] run return run tp @s @e[type=marker,tag=this_tp,sort=random,limit=1]

#tp場所があればランダムにtp
tp @s @e[type=marker,tag=no_tp,sort=random,limit=1]
execute at @s run tag @e[type=marker,tag=no_tp,sort=nearest,limit=1] remove no_tp