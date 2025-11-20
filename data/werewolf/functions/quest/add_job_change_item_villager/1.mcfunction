## 新商品追加処理

#就職案内書
execute as @e[type=wandering_trader,tag=shop_2] run \
data modify entity @s Offers.Recipes append value {rewardExp:0b,maxUses:1,xp:0,\
    buy:{id:"minecraft:emerald",count:1b},\
    sell:{components:{"minecraft:custom_data":{Tags:["job_change_villager","quest"]},"minecraft:custom_model_data":1005,"minecraft:custom_name":'{"color":"white","italic":false,"text":"就職案内書[村人専用](右クリックで使用)"}',"minecraft:enchantment_glint_override":0b,"minecraft:enchantments":{levels:{"minecraft:vanishing_curse":1},show_in_tooltip:0b},"minecraft:lore":['{"color":"gray","italic":false,"text":"[アイテム説明]"}','{"color":"gray","italic":false,"text":"自身が村人の場合、選択された"}','{"color":"gray","italic":false,"text":"村役職の1つにランダムで転職する"}','{"color":"gray","italic":false,"text":"一度使うと消滅する"}']},count:1,id:"minecraft:carrot_on_a_stick"}\
}