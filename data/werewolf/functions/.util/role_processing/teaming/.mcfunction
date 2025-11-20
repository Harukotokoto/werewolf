##役職の合計人数を算出
#スコアボードを用意
scoreboard players set #reserve reserve_0 0
#計算(output:reserve_0)
function werewolf:.util/role_processing/teaming/0 with storage macro: util.role_processing

##役職と参加人数の差分を算出
#参加プレイヤーの人数を保存
execute store result score #reserve reserve_1 if entity @a[team=_entrant]
#差分を算出(output:reserve_0)
scoreboard players operation #reserve reserve_0 -= #reserve reserve_1

##ゲームの中断判定
#storageをリセット
data remove storage macro: reserve_0
#人数が1人以下ならゲームを中断
execute if data storage werewolf: settings{debug:false} run execute if score #reserve reserve_1 matches ..1 run data modify storage macro: reserve_0 set value 1
execute if data storage werewolf: settings{debug:false} run execute if data storage macro: {reserve_0:1} run return run tellraw @a "[システム] 参加人数の条件を満たしていないためゲームを中断します。"
#役職が欠ける構成ならゲームを中断
execute if data storage werewolf: settings{debug:false} run execute if data storage werewolf: camp_details.count{wolf:0} run data modify storage macro: reserve_0 set value 1
execute if data storage werewolf: settings{debug:false} run execute if data storage macro: {reserve_0:1} run return run tellraw @a "[システム] 狼陣営が選択されない役職構成のためゲームを中断します。"
execute if data storage werewolf: settings{debug:false} run execute if data storage werewolf: camp_details.count{villager:0} if score #reserve reserve_0 matches 0.. run data modify storage macro: reserve_0 set value 1
execute if data storage werewolf: settings{debug:false} run execute if data storage macro: {reserve_0:1} run return run tellraw @a "[システム] 村陣営が選択されない役職構成のためゲームを中断します。"

##ゲーム開始前ならここでreturn
execute unless data storage werewolf: {phase:"playing"} run return run help


##プレイヤーに役職割当中のタグを付与
execute as @a[team=_entrant] run tag @s add role_assigning

##ダミープレイヤーを召喚
execute as @a[team=_entrant] at @s run summon armor_stand ~ ~ ~ {Team:"_entrant",Tags:["player_dummy","role_assigning"],Marker:true,Invisible:true,NoGravity:true}
execute if score #reserve reserve_0 matches 1.. run function werewolf:.util/role_processing/teaming/2

##役職を割り振る
#選択役職処理
function werewolf:.util/role_processing/teaming/3 with storage macro: util.role_processing
#余りは村人に
execute as @e[team=_entrant] run team join mura
execute as @a[team=mura] run tag @s add villager_tentative

##プレイヤー内に狼/村がいない場合の処理
execute if data storage werewolf: settings{debug:false} run execute unless entity @a[tag=wolf_tentative] run function werewolf:.util/role_processing/teaming/5
execute if data storage werewolf: settings{debug:false} run execute unless entity @a[tag=villager_tentative] run function werewolf:.util/role_processing/teaming/5
##人狼とその他陣営の人数調整設定
execute unless data storage werewolf: settings.gamemode{role_count_limit:0} run function werewolf:.util/role_processing/teaming/6

##おかたづけ
#ダミープレイヤーをキル
kill @e[type=armor_stand,tag=player_dummy]
#タグを削除
tag @a remove role_assigning
tag @a remove wolf_tentative
tag @a remove villager_tentative


##ゲームの中断判定に必要な処理
return fail