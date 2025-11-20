##price_add
$execute store result score #GameManager reserve_0 run data get storage werewolf: settings.shop.price.$(goods)
scoreboard players add #GameManager reserve_0 1

#100以上なら100に
execute if score #GameManager reserve_0 matches 100.. run scoreboard players set #GameManager reserve_0 100

$execute store result storage werewolf: settings.shop.price.$(goods) int 1 run scoreboard players get #GameManager reserve_0


##表示更新
$function werewolf:settings/.menu/shop/shop_$(page)