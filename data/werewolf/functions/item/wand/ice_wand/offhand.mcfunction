#残り回数を更新
$item modify entity @s weapon.offhand {"function": "minecraft:set_name","name": {"text": "氷の杖[$(reserve_1)]","color": "white","italic": false}}
$item modify entity @s weapon.offhand {"function": "minecraft:set_custom_data","tag": "{Tags:[\"wand\",\"ice\"],count:$(reserve_1)}"}

# 耐久を減少
item modify entity @s weapon.offhand werewolf:set_damage/wand_durability_remove

# 耐久値が0なら破壊処理
execute unless items entity @s weapon.offhand *[minecraft:custom_data~{count:0}] run return fail
execute anchored eyes run particle item{item:{id:carrot_on_a_stick,components:{custom_model_data:1101}}} ^ ^-0.25 ^0.5 0.15 0.15 0.15 0 4 force @a
playsound minecraft:entity.item.break master @a ~ ~ ~ 1.0 1 0.0
item replace entity @s weapon.offhand with air