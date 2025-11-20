## 新商品追加処理

#氷の剣
execute as @e[type=wandering_trader,tag=shop_1] run \
data modify entity @s Offers.Recipes append value {rewardExp:0b,maxUses:1,xp:0,\
    buy:{id:"minecraft:emerald",count:20b},\
    sell:{components:{"minecraft:attribute_modifiers":{modifiers:[{amount:999.0d,name:"generic.attack_damage",operation:"add_value",type:"minecraft:generic.attack_damage",uuid:[I;486475636,-652544697,-872636307,-877740317]}],show_in_tooltip:0b},"minecraft:custom_data":{Tags:["ice_sword","quest"]},"minecraft:custom_model_data":1000,"minecraft:custom_name":'{"color":"white","italic":false,"text":"氷の剣"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"すさまじい攻撃力を誇る氷剣"}','{"color":"gray","italic":false,"text":"使用または所有者の死亡で砕け散ってしまう"}','{"text": "‣ Attack:","color": "gray","italic": false,"extra": [{ "text": "","color": "white"}]}']},count:1,id:"minecraft:wooden_sword"}\
}