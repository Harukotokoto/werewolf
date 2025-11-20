##スキル処理

##背徳者に変更
#役職タグリセット
function werewolf:.util/role_processing/remove_role_tag/
#teamに加入
team join haitoku
function werewolf:role/haitoku/setup/join

#スキル/役職本を更新
item replace entity @s hotbar.7 with air
item replace entity @s hotbar.8 with air

#演出
tellraw @s [{"text":"あなたは背徳者になった。","color":"aqua"}]
particle soul_fire_flame ~ ~ ~ 0.3 1 0.3 0 30 force @s
playsound minecraft:entity.blaze.shoot master @s
