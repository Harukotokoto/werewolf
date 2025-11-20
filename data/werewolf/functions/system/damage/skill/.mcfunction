##進捗
advancement revoke @s only werewolf:damage/skill

##妖狐
execute as @s[team=youko] at @s run return run function werewolf:system/damage/skill/youko

##騎士
execute as @s[tag=protected] store result storage macro: reserve_10 int 1 run scoreboard players get @s ID
execute as @s[tag=protected] at @s run return run function werewolf:system/damage/skill/kishi with storage macro:

##通常ダメージ処理
damage @s 100 werewolf:skill

