##スキル処理
#役職を表示
$tellraw @s [{"selector":"@a[scores={ID=$(reserve_2)},limit=1]"},{"text":"の役職は "},{"interpret":true,"nbt":"role.$(reserve_0).name","storage":"werewolf:","color":"#4e5c24"},{"text":"  のようだ。"}]