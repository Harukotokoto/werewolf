##スキル処理
#死神役職tag削除
function werewolf:role/shinigami/setup/reset_0
#team加入
$team join $(reserve_0)
$function werewolf:role/$(reserve_0)/setup/join