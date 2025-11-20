## 演出
playsound minecraft:ui.button.click master @s ~ ~100 ~ 1 1 0.3

## 通常
execute as @s[team=assassin] run return run function werewolf:role/assassin/role_book/normal
## dummy
execute as @s[tag=dummy_role] run return run function werewolf:role/assassin/role_book/dummy
## lost
execute as @s[tag=role_lost] run function werewolf:role/assassin/role_book/lost