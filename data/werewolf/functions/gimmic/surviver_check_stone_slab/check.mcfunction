## 生存確認出力

advancement revoke @s only werewolf:interacted_with_entity/gimmic/surviver_check_stone_slab
#return
execute unless data storage werewolf: {phase:"playing"} run return fail


#実行者にタグ付け
tag @s add check_stone

#出力
tellraw @s {"text":"[生存確認]"}
#プレイヤーごとの処理
execute as @a[team=!_spectator] run function werewolf:gimmic/surviver_check_stone_slab/0

#実行者のタグ削除
tag @s remove check_stone


