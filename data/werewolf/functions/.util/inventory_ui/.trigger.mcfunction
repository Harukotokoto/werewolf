##ゲーム中/アイテム未所持のみ実行
execute unless data storage werewolf: {phase:"playing"} unless data storage werewolf: {phase:"switch_stanby"} as @s[predicate=!werewolf:inventory_ui/slot/container/] run function werewolf:.util/inventory_ui/
execute if data storage werewolf: {phase:"playing"} run clear @s *[minecraft:custom_data~{Tags:["inventory_ui"]}]

##進捗を取り消し
advancement revoke @s only werewolf:inventory_ui/