##falseならreturn
execute if data storage werewolf: system{inventory_seal:false} run return run advancement revoke @s only werewolf:inventory_seal/

##ゲーム中/アイテム未所持のみ実行
execute if data storage werewolf: {phase:"playing"} as @s[predicate=!werewolf:inventory_seal/slot/container/] run function werewolf:.util/inventory_seal/
execute unless data storage werewolf: {phase:"playing"} run clear @s *[minecraft:custom_data~{Tags:["inventory_seal"]}]

##進捗を取り消し
advancement revoke @s only werewolf:inventory_seal/