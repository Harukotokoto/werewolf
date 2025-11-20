##スキル処理
# ダミー
$damage @a[scores={ID=$(reserve_0)},limit=1] 1 werewolf:dummy_skill by @s
$tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"red"},{"text":"は人狼陣営だったようだ。","color":"red"}]
function werewolf:role/soujiya/skill/effect_dummy