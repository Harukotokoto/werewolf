##スキル処理
# 通常
#成功
$kill @a[scores={ID=$(reserve_0)}]
$tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"red"},{"text":"は人狼陣営だったようだ。","color":"red"}]
function werewolf:role/soujiya/skill/effect