##通常

## 役職本動作
execute if entity @a[tag=be_written_haitoku,tag=!role_lost,scores={ID=1..}] run tellraw @s [{"text":"今回の妖狐は… "},{"selector":"@a[tag=be_written_haitoku,tag=!role_lost,scores={ID=1..}]"},{"text":" のようだ。"}]
execute unless entity @a[tag=be_written_haitoku,tag=!role_lost,scores={ID=1..}] run tellraw @s [{"text":"妖狐は居ないようだ…"}]