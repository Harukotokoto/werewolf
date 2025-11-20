##スキル処理
#妖狐処理
particle soul_fire_flame ~ ~1 ~ 0.5 0.5 0.5 0 10 force @s
playsound minecraft:entity.blaze.shoot master @s
tellraw @s {"text":"あなたは占われてしまった…"}
kill @s
