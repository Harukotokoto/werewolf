##クールタイム設定
#剣を持ち替え
item modify entity @s weapon.mainhand werewolf:set_custom_data/sword/strong_sword_cooltime
#クールタイムを設定
scoreboard players set @s swords_cooltime 13

##エフェクト処理
#パーティクル
execute anchored eyes run particle minecraft:sweep_attack ^ ^ ^1.2
#効果音
playsound minecraft:entity.player.attack.sweep master @a

##プレイヤー以外に対するダメージ処理
execute at @s run function werewolf:.util/eye_detection/mobs/
damage @e[tag=target,sort=nearest,limit=1] 6 werewolf:dummy_skill
tag @e[tag=this,sort=nearest,limit=1] remove target


advancement revoke @s only werewolf:player_hurt_entity/item/strong_sword