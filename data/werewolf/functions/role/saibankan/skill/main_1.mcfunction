##スキル処理
# 共通
$tellraw @s [{"selector":"@a[scores={ID=$(reserve_0)},limit=1]","color":"green"},{"text":"を後任に指名した。","color":"green"}]

# 通常
$execute if entity @s[team=saibankan] as @a[scores={ID=$(reserve_0)}] run tag @s add saibankan_successor
$execute if entity @s[team=saibankan] as @a[scores={ID=$(reserve_0)}] run tellraw @s [{"text":"あなたは裁判官の後任に指名された。","color":"green"}]

# ダミー
