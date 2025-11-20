## パン置き換え処理

#x1
execute as @e[type=wandering_trader,tag=shop_0] if data entity @s Offers.Recipes[0].sell{id:"minecraft:bread",count:1} run \
data modify entity @s Offers.Recipes[0] set value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:1b},\
    sell:{components:{"minecraft:custom_name":'{"color":"white","italic":false,"text":"ジャガイモ"}',"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"よくあるジャガイモ"}','{"color":"gray","italic":false,"text":"食糧不足の時に重宝される"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Food:"}']},count:1,id:"minecraft:potato"}\
}

#x5
execute as @e[type=wandering_trader,tag=shop_0] if data entity @s Offers.Recipes[0].sell{id:"minecraft:bread",count:5} run \
data modify entity @s Offers.Recipes[0] set value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:5b},\
    sell:{components:{"minecraft:custom_name":'{"color":"white","italic":false,"text":"ジャガイモ"}',"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"よくあるジャガイモ"}','{"color":"gray","italic":false,"text":"食糧不足の時に重宝される"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Food:"}']},count:5,id:"minecraft:potato"}\
}
execute as @e[type=wandering_trader,tag=shop_0] if data entity @s Offers.Recipes[1].sell{id:"minecraft:bread",count:5} run \
data modify entity @s Offers.Recipes[1] set value {rewardExp:0b,maxUses:2147483647,xp:0,\
    buy:{id:"minecraft:emerald",count:5b},\
    sell:{components:{"minecraft:custom_name":'{"color":"white","italic":false,"text":"ジャガイモ"}',"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"よくあるジャガイモ"}','{"color":"gray","italic":false,"text":"食糧不足の時に重宝される"}','{"color":"gray","extra":[{"color":"white","text":""}],"italic":false,"text":"‣ Food:"}']},count:5,id:"minecraft:potato"}\
}