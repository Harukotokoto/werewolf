# アイテムをweapon.offhandに返却
execute unless items entity @s container.9 *[minecraft:custom_data~{Tags:["inventory_ui"]}] run item replace entity @s weapon.offhand from entity @s container.9
execute unless items entity @s container.10 *[minecraft:custom_data~{Tags:["inventory_ui"]}] run item replace entity @s weapon.offhand from entity @s container.10
execute unless items entity @s container.11 *[minecraft:custom_data~{Tags:["inventory_ui"]}] run item replace entity @s weapon.offhand from entity @s container.11