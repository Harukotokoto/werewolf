##スキル処理
#対象者のIDを退避
data modify storage macro: reserve_2 set from storage macro: reserve_0

# 通常
#対象にタグ付け
$execute if entity @s[team=shaman] run tag @a[scores={ID=$(reserve_0)},limit=1] add role_search
# ダミー
#ランダムにタグ付け ※仮の処理。後に選択される可能性のある役職すべてを対象に。
execute if entity @s[team=!shaman] run tag @a[sort=random,limit=1] add role_search

# 以下共通
#相手のteamを検索
execute as @a[tag=role_search] run function werewolf:.util/role_processing/get_role_dead/
#役職を表示
function werewolf:role/shaman/skill/main_2 with storage macro:
#tagを削除
tag @a remove role_search