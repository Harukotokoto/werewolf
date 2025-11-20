##演出
execute at @s run particle minecraft:white_smoke ~ ~0.75 ~ 0.3 0.5 0.3 0 30 force @a
execute at @s run playsound minecraft:entity.villager.work_cartographer master @a ~ ~ ~ 1.0 1 0.0

##アイテム使用者のmainhandをairに
item replace entity @s weapon.mainhand with air

##転職
#自身が村ではない
execute unless entity @s[team=mura] run return run tellraw @s {"text":"あなたは村人でないため役職に就けなかった。","color":"red"}

#不要な陣営タグを削除
tag @s remove team_mura
tag @s remove camp_villager
#ランダムに村役職を選びその役職joinを実行
function werewolf:item/job_change_villager/

##スキル及び役職本を更新
item replace entity @s hotbar.7 with air
item replace entity @s hotbar.8 with air

##アナウンス
execute unless entity @s[team=mura] run tellraw @s {"text":"あなたは就職に成功した。","color":"green"}