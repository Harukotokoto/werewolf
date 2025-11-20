#残り回数を更新
$item modify entity @s weapon.mainhand {"function": "minecraft:set_name","name": {"text": "氷の杖[$(reserve_0)]","color": "white","italic": false}}
$item modify entity @s weapon.mainhand {"function": "minecraft:set_custom_data","tag": "{Tags:[\"wand\",\"ice\"],count:$(reserve_0)}"}

# 耐久を減少
item modify entity @s weapon.mainhand werewolf:set_damage/wand_durability_remove

# 耐久値が0なら破壊処理
execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{count:0}] run return fail
execute anchored eyes run particle item{item:{id:carrot_on_a_stick,components:{custom_model_data:1101}}} ^ ^-0.25 ^0.5 0.15 0.15 0.15 0 4 force @a
playsound minecraft:entity.item.break master @a ~ ~ ~ 1.0 1 0.0
item replace entity @s weapon.mainhand with air