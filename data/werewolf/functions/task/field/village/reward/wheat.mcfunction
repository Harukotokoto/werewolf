##報酬
execute store result score #GameManager reserve_0 run random value 0..9
execute on attacker if score #GameManager reserve_0 matches ..2 run give @s emerald 1

##消滅処理
execute align xyz positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
setblock ~ ~ ~ air destroy
kill @s