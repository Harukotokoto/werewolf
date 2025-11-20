## 頭装備データをアイテムディスプレイに避難
summon minecraft:item_display ~ ~ ~ {width:0f,height:0f,Tags:["hat_save"]}
data modify entity @e[type=minecraft:item_display,tag=hat_save,sort=nearest,limit=1] item set from entity @s Inventory[{Slot:103b}]

## 手に持った装備を頭に
item replace entity @s armor.head from entity @s weapon.mainhand

## 避難したアイテムを手に
item replace entity @s weapon.mainhand from entity @e[type=minecraft:item_display,tag=hat_save,sort=nearest,limit=1] container.0

## アイテムディスプレイをおかたづけ
kill @e[type=minecraft:item_display,tag=hat_save]

## 演出
playsound minecraft:item.armor.equip_generic master @a ~ ~ ~ 1.0 1 0.0