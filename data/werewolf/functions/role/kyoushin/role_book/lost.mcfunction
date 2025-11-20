##通常

## 役職本動作
execute if entity @a[tag=be_written_jinrou_origin,scores={ID=1..}] run tellraw @s [{"text":"今回の人狼は… "},{"selector":"@s"},{"text":", ","color":"gray"},{"selector":"@a[tag=be_written_jinrou_origin,scores={ID=1..}]"},{"text":" のようだ。"}]
execute unless entity @a[tag=be_written_jinrou_origin,scores={ID=1..}] run tellraw @s [{"text":"人狼は居ないようだ…"}]