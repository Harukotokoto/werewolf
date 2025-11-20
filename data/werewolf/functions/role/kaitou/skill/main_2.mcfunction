##スキル処理
#対象にタグ付け
tag @a remove role_changing
$tag @a[scores={ID=$(reserve_0)},limit=1,sort=nearest] add role_changing

#相手のteamを検索
execute as @a[tag=role_changing] run function werewolf:.util/role_processing/get_role/

#相手が怪盗だった場合の例外処理
execute if data storage macro: {reserve_0:"kaitou"} run scoreboard players set @s skill_cooltime_0 0
execute if data storage macro: {reserve_0:"kaitou"} run scoreboard players add @s skill_limit_0 1
execute if data storage macro: {reserve_0:"kaitou"} run tag @a remove role_changing
execute if data storage macro: {reserve_0:"kaitou"} run return run tellraw @s [{"text":"","color":"green"},{"text":"不思議な力でスキルはかき消された。"}]

#役職変更
function werewolf:role/kaitou/skill/main_3 with storage macro:
#加入するチームをリザルトのため記録
function werewolf:role/kaitou/skill/main_4 with storage macro:
#スキルクールタイム/使用回数を引き継ぎ
scoreboard players operation @s skill_cooltime_0 = @a[tag=role_changing,limit=1] skill_cooltime_0
scoreboard players operation @s skill_cooltime_1 = @a[tag=role_changing,limit=1] skill_cooltime_1
scoreboard players operation @s skill_cooltime_2 = @a[tag=role_changing,limit=1] skill_cooltime_2
scoreboard players operation @s skill_cooltime_3 = @a[tag=role_changing,limit=1] skill_cooltime_3
scoreboard players operation @s skill_limit_0 = @a[tag=role_changing,limit=1] skill_limit_0
scoreboard players operation @s skill_limit_1 = @a[tag=role_changing,limit=1] skill_limit_1
scoreboard players operation @s skill_limit_2 = @a[tag=role_changing,limit=1] skill_limit_2
scoreboard players operation @s skill_limit_3 = @a[tag=role_changing,limit=1] skill_limit_3
#スキル/役職本を更新
item replace entity @s hotbar.7 with air
item replace entity @s hotbar.8 with air

#アナウンス
tellraw @s [{"text":"","color":"green"},{"text":"あなたは"},{"selector":"@a[tag=role_changing]"},{"text":"の能力を得た。"}]

#エフェクト
function werewolf:role/kaitou/skill/effect

#対象の役職を怪盗に変更
team join kaitou @a[tag=role_changing]
#勝利判定用のtagを更新
tag @a[tag=role_changing] remove camp_wolf
tag @a[tag=role_changing] remove camp_maniac
tag @a[tag=role_changing] remove camp_third
tag @a[tag=role_changing] add camp_villager
#役職喪失タグを追加
tag @a[tag=role_changing] add role_lost

#勝利判定除外タグを削除
tag @a[tag=role_changing] remove no_judgment
#tagを削除
tag @a remove role_changing

#語り
execute if data storage werewolf: role.kaitou{talk:true} run function werewolf:role/kaitou/skill/talking/.skill