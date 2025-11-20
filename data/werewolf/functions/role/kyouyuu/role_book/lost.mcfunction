##通常

## 役職本動作
tag @s add its_me
execute if entity @a[tag=be_written_kyouyuu_origin,tag=!its_me,scores={ID=1..}] run tellraw @s [{"text":"今回の共有者は… "},{"selector":"@s"},{"text":", ","color":"gray"},{"selector":"@a[tag=be_written_kyouyuu_origin,tag=!its_me,scores={ID=1..}]"},{"text":" のようだ。"}]
execute unless entity @a[tag=be_written_kyouyuu_origin,tag=!its_me,scores={ID=1..}] run tellraw @s [{"text":"あなた以外に共有者は居ないようだ…"}]
tag @s remove its_me