#ダミープレイヤーを陣営に加入
$team join $(result) @e[type=armor_stand,team=_entrant,tag=player_dummy,sort=random,limit=$(number)]
#プレイヤー本体を陣営に加入
$execute as @e[type=armor_stand,tag=player_dummy,tag=!non_player,team=$(result)] at @s as @a[distance=..0.05,team=_entrant,sort=nearest,limit=1] run team join $(result)

#プレイヤー本体が狼陣営ならタグを付与
$execute if data storage macro: util.role_processing{camp:"wolf"} run tag @a[team=$(result)] add wolf_tentative
#プレイヤー本体が村陣営ならタグを付与
$execute if data storage macro: util.role_processing{camp:"villager"} run tag @a[team=$(result)] add villager_tentative