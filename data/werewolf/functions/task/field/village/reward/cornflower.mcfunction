##報酬
execute on attacker run give @s emerald 1

##消滅処理
execute align xyz positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
setblock ~ ~ ~ air replace
execute align xyz positioned ~0.5 ~ ~0.5 run playsound minecraft:block.grass.break block @a
execute align xyz positioned ~0.5 ~ ~0.5 run particle minecraft:block{block_state: {Name: "minecraft:cornflower"}} ~ ~0.5 ~ 0 0 0 0 20
execute align xyz positioned ~0.5 ~ ~0.5 run kill @e[type=block_display,tag=night_task,distance=..0.9]
kill @s