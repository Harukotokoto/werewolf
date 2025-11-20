##通常

## 役職本動作
execute if entity @a[tag=be_written_haitoku_origin,scores={ID=1..}] run tellraw @s [{"text":"今回の妖狐は… "},{"selector":"@s"},{"text":", ","color":"gray"},{"selector":"@a[tag=be_written_haitoku_origin,scores={ID=1..}]"},{"text":" のようだ。"}]
execute unless entity @a[tag=be_written_haitoku_origin,scores={ID=1..}] run tellraw @s [{"text":"妖狐は居ないようだ…"}]