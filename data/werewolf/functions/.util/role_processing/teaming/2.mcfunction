##ダミープレイヤーを召喚
summon armor_stand ~ ~ ~ {Team:"_entrant",Tags:["player_dummy","non_player","role_assigning"],Marker:true,Invisible:true,NoGravity:true}

##再帰回数を減算
scoreboard players remove #reserve reserve_0 1

##再帰処理
execute if score #reserve reserve_0 matches 1.. run function werewolf:.util/role_processing/teaming/2