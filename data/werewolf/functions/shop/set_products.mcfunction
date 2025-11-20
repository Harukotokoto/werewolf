#function werewolf:shop/set_products with storage werewolf: settings.shop.price で実行

##価格を設定
#商品をリセット
execute as @e[type=wandering_trader,tag=shop] run data modify entity @s Offers.Recipes set value []


##商品を追加

##食料
#パン
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{bread:0} run data modify entity @s[tag=shop_0] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(bread)b},\
    sell:{components:{"minecraft:custom_name":'{"color":"white","italic":false,"text":"焼きたてのパン"}',"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"美味しそうなパン"}','{"color":"gray","italic":false,"text":"焼きたての良い香りがする"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Food:"}']},count:1,id:"minecraft:bread"}\
}
#パン
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{breads:0} run data modify entity @s[tag=shop_0] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(breads)b},\
    sell:{components:{"minecraft:custom_name":'{"color":"white","italic":false,"text":"焼きたてのパン"}',"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"美味しそうなパン"}','{"color":"gray","italic":false,"text":"焼きたての良い香りがする"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Food:"}']},count:5,id:"minecraft:bread"}\
}

##武器/ツール
#ボロい剣
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{normal_sword:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(normal_sword)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["normal_sword","active","weapon"]},"minecraft:custom_model_data":1000,"minecraft:custom_name":'{"color":"white","italic":false,"text":"ボロい剣"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"使い込まれたボロボロの剣"}','{"color":"gray","italic":false,"text":"壊れることはない"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Attack:"}']},count:1,id:"minecraft:carrot_on_a_stick"}\
}
#良い剣
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{strong_sword:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(strong_sword)b},buyB:{components:{"minecraft:custom_model_data":1000,"minecraft:custom_name":'{"color":"white","italic":false,"text":"ボロい剣"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"使い込まれたボロボロの剣"}','{"color":"gray","italic":false,"text":"壊れることはない"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Attack:"}']},count:1,id:"minecraft:carrot_on_a_stick"},\
    sell:{components:{"minecraft:custom_data":{Tags:["strong_sword","active","weapon"]},"minecraft:custom_model_data":1001,"minecraft:custom_name":'{"color":"white","italic":false,"text":"良い剣"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"多くの者が愛用する鋭い剣"}','{"color":"gray","italic":false,"text":"壊れることはない"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Attack:"}']},count:1,id:"minecraft:carrot_on_a_stick"}\
}
#頑丈な弓
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{normal_bow:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(normal_bow)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["normal_bow"]},"minecraft:custom_name":'{"color":"white","italic":false,"text":"頑丈な弓"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"いくら使っても壊れる気配のない弓"}'],"minecraft:unbreakable":{show_in_tooltip:0b}},count:1,id:"minecraft:bow"}\
}
#普通の弓矢x5
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{normal_arrow:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(normal_arrow)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["normal_arrow"]},"minecraft:custom_name":'{"color":"white","italic":false,"text":"普通の弓矢"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"どこにでもある普通の弓矢"}']},count:5,id:"minecraft:arrow"}\
}
#炎の杖
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{fire_wand:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(fire_wand)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["wand","fire"],count:20},"minecraft:custom_model_data":1100,"minecraft:custom_name":'{"color":"white","italic":false,"text":"炎の杖[20]"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"魔力が込められた杖"}','{"color":"gray","italic":false,"text":"着弾地点で爆発する魔法弾を放つ"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Attack:"}'],"minecraft:max_damage":100,"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b}},count:1,id:"minecraft:carrot_on_a_stick"}\
}
#氷の杖
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{ice_wand:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(ice_wand)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["wand","ice"],count:20},"minecraft:custom_model_data":1101,"minecraft:custom_name":'{"color":"white","italic":false,"text":"氷の杖[20]"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"魔力が込められた杖"}','{"color":"gray","italic":false,"text":"直撃すると移動速度が低下する魔法弾を放つ"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Attack:"}'],"minecraft:max_damage":100,"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b}},count:1,id:"minecraft:carrot_on_a_stick"}\
}
#雷の杖
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{thunder_wand:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(thunder_wand)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["wand","thunder"],count:20},"minecraft:custom_model_data":1102,"minecraft:custom_name":'{"color":"white","italic":false,"text":"雷の杖[20]"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"魔力が込められた杖"}','{"color":"gray","italic":false,"text":"弾速が速く、壁で反射する魔法弾を放つ"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Attack:"}'],"minecraft:max_damage":100,"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b}},count:1,id:"minecraft:carrot_on_a_stick"}\
}
#回復の杖
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{heal_wand:0} run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(heal_wand)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["wand","heal"],count:10},"minecraft:custom_model_data":1103,"minecraft:custom_name":'{"color":"white","italic":false,"text":"回復の杖[10]"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"魔力が込められた杖"}','{"color":"gray","italic":false,"text":"直撃すると回復する魔法弾を放つ"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Recovery:"}'],"minecraft:max_damage":100,"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b}},count:1,id:"minecraft:carrot_on_a_stick"}\
}

#予備の頑丈な斧
execute as @e[type=wandering_trader,tag=shop] run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:1b},\
    sell:{components:{"minecraft:attribute_modifiers":{modifiers:[{amount:0.0d,name:"generic.attack_damage",operation:"add_value",type:"minecraft:generic.attack_damage",uuid:[I;386475636,-602544697,-872632307,-878740317]}],show_in_tooltip:0b},"minecraft:custom_name":'{"color":"white","italic":false,"text":"予備の頑丈な斧"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"いくら使っても壊れる気配のない予備の斧"}','{"color":"gray","italic":false,"text":"攻撃するためのものではない"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ 採集可能: "}'],"minecraft:unbreakable":{show_in_tooltip:0b}},count:1,id:"minecraft:iron_axe"}\
}
#予備の頑丈なピッケル
execute as @e[type=wandering_trader,tag=shop] run data modify entity @s[tag=shop_1] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:1b},\
    sell:{components:{"minecraft:attribute_modifiers":{modifiers:[{amount:0.0d,name:"generic.attack_damage",operation:"add_value",type:"minecraft:generic.attack_damage",uuid:[I;386475636,-602544697,-872632307,-878740317]}],show_in_tooltip:0b},"minecraft:custom_name":'{"color":"white","italic":false,"text":"予備の頑丈なツルハシ"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"いくら使っても壊れる気配のない予備のツルハシ"}','{"color":"gray","italic":false,"text":"攻撃するためのものではない"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ 採集可能: "}'],"minecraft:unbreakable":{show_in_tooltip:0b}},count:1,id:"minecraft:iron_pickaxe"}\
}

##特殊アイテム
#煙玉
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{smoke_bomb:0} run data modify entity @s[tag=shop_2] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(smoke_bomb)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["smoke_bomb"]},"minecraft:custom_model_data":2,"minecraft:custom_name":'{"color":"white","italic":false,"text":"煙玉(右クリックで使用)"}',"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"投げるとすぐに煙が噴き出す"}','{"color":"gray","italic":false,"text":"スニークしながら投擲で起爆までの時間が延びる"}']},count:3,id:"minecraft:snowball"}\
}
#手投げ爆弾
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{tnt_bomb:0} run data modify entity @s[tag=shop_2] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(tnt_bomb)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["tnt_bomb"]},"minecraft:custom_model_data":3,"minecraft:custom_name":'{"color":"white","italic":false,"text":"手投げ爆弾(右クリックで使用)"}',"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"投げるとすぐに爆発する"}','{"color":"gray","italic":false,"text":"スニークしながら投擲で起爆までの時間が延びる"}']},count:1,id:"minecraft:snowball"}\
}
#盲目ツール
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{blindness_tool:0} run data modify entity @s[tag=shop_2] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(blindness_tool)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["blindness_tool"]},"minecraft:custom_model_data":1002,"minecraft:custom_name":'{"color":"white","italic":false,"text":"盲目付与ツール(右クリックで使用)"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"人狼以外に10秒間盲目を付与する"}','{"color":"gray","italic":false,"text":"一度使うと消滅する"}']},count:1,id:"minecraft:carrot_on_a_stick"}\
}
#容姿統一ツール
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{same_look_tool:0} run data modify entity @s[tag=shop_2] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(same_look_tool)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["same_look_tool"]},"minecraft:custom_model_data":1003,"minecraft:custom_name":'{"color":"white","italic":false,"text":"容姿統一ツール(右クリックで使用)"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"全員の見た目が30秒間同一となる"}','{"color":"gray","italic":false,"text":"一度使うと消滅する"}']},count:1,id:"minecraft:carrot_on_a_stick"}\
}
#発光ツール
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{glowing_tool:0} run data modify entity @s[tag=shop_2] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(glowing_tool)b},\
    sell:{components:{"minecraft:custom_data":{Tags:["glowing_tool"]},"minecraft:custom_model_data":1004,"minecraft:custom_name":'{"color":"white","italic":false,"text":"発光ツール(右クリックで使用)"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"全員が10秒間光り輝く"}','{"color":"gray","italic":false,"text":"一度使うと消滅する"}']},count:1,id:"minecraft:carrot_on_a_stick"}\
}

##ポーション
#透明化のポーション
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{invisibility_potion:0} run data modify entity @s[tag=shop_3] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(invisibility_potion)b},\
    sell:{components:{"minecraft:custom_model_data":1,"minecraft:custom_name":'{"color":"white","italic":false,"text":"透明化のポーション"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"飲むと10秒間透明になる"}'],"minecraft:potion_contents":{custom_color:15987699,custom_effects:[{amplifier:255,duration:200,id:"minecraft:invisibility",show_icon:1b,show_particles:0b}]}},count:1,id:"minecraft:potion"}\
}
#俊敏のポーション
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{swiftness_potion:0} run data modify entity @s[tag=shop_3] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(swiftness_potion)b},\
    sell:{components:{"minecraft:custom_model_data":2,"minecraft:custom_name":'{"color":"white","italic":false,"text":"俊敏のポーション"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"飲むと10秒間移動速度が上昇する"}'],"minecraft:potion_contents":{custom_color:3336444,custom_effects:[{duration:200,id:"minecraft:speed",show_icon:1b,show_particles:0b}]}},count:1,id:"minecraft:potion"}\
}
#毒のスプラッシュポーション
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{poison_splash_potion:0} run data modify entity @s[tag=shop_3] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(poison_splash_potion)b},\
    sell:{components:{"minecraft:custom_model_data":1,"minecraft:custom_name":'{"color":"white","italic":false,"text":"毒のスプラッシュポーション"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"当たると10秒間毒状態になる"}'],"minecraft:potion_contents":{custom_color:8757602,custom_effects:[{amplifier:3b,duration:200,id:"minecraft:poison",show_icon:1b,show_particles:0b}]}},count:1,id:"minecraft:splash_potion"}\
}
#鈍化のスプラッシュポーション
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{slowness_splash_potion:0} run data modify entity @s[tag=shop_3] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(slowness_splash_potion)b},\
    sell:{components:{"minecraft:custom_model_data":2,"minecraft:custom_name":'{"color":"white","italic":false,"text":"鈍化のスプラッシュポーション"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"当たると10秒間移動速度が低下する"}'],"minecraft:potion_contents":{custom_color:9022941,custom_effects:[{amplifier:2b,duration:200,id:"minecraft:slowness",show_icon:1b,show_particles:0b}]}},count:1,id:"minecraft:splash_potion"}\
}
#再生のスプラッシュポーション
$execute as @e[type=wandering_trader,tag=shop] unless data storage werewolf: settings.shop.price{regeneration_splash_potion:0} run data modify entity @s[tag=shop_3] Offers.Recipes append value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:$(regeneration_splash_potion)b},\
    sell:{components:{"minecraft:custom_model_data":3,"minecraft:custom_name":'{"color":"white","italic":false,"text":"再生のスプラッシュポーション"}',"minecraft:hide_additional_tooltip":{},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"当たると10秒間再生能力が向上する"}'],"minecraft:potion_contents":{custom_color:13327273,custom_effects:[{amplifier:2b,duration:200,id:"minecraft:regeneration",show_icon:1b,show_particles:0b}]}},count:1,id:"minecraft:splash_potion"}\
}