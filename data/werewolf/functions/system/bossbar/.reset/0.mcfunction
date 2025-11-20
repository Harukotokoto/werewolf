##bossbarを削除
$bossbar remove personal_$(reserve_0)

##再帰回数を減算
execute store result storage macro: reserve_0 int 0.99999 run data get storage macro: reserve_0


##中断処理
execute if data storage macro: {reserve_0:0} run return fail
##再帰処理
function werewolf:system/bossbar/.reset/0 with storage macro: