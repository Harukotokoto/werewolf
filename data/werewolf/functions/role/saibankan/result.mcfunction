##サブ結果出力コマンドを記録
execute if entity @a[tag=saibankan_successor] run data modify storage werewolf: game_result.sub append value \
'[{"text":"<後任裁判官>  ","color":"green"},{"selector":"@a[tag=saibankan_successor]","color":"green"}]'