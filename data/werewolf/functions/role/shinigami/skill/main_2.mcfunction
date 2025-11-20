##スキル処理
#対象にタグ付け
$tag @a[scores={ID=$(reserve_0)},limit=1] add role_changing
$tag @a[scores={ID=$(reserve_0)},limit=1] add no_ability_activation

#相手のteamを検索
execute as @a[tag=role_changing] run function werewolf:.util/role_processing/get_role/
#役職変更
function werewolf:role/shinigami/skill/main_3 with storage macro:
#加入するチームをリザルトのため記録
function werewolf:role/shinigami/skill/main_4 with storage macro:
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
tellraw @s [{"text":"","color":"aqua"},{"text":"あなたは"},{"selector":"@a[tag=role_changing]"},{"text":"の能力を複写した。"}]

#エフェクト
function werewolf:role/shinigami/skill/effect

#対象をキル
kill @a[tag=role_changing]
#tagを削除
tag @a remove role_changing