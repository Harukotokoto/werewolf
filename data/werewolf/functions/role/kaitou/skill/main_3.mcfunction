##スキル処理
#ダミー役職を公開状態で取得するためのtag追加
tag @s add no_get_dummy
#怪盗役職tag削除
function werewolf:role/kaitou/setup/reset_0
#team加入
$team join $(reserve_0)
$function werewolf:role/$(reserve_0)/setup/join
#tagのおかたづけ
tag @a remove no_get_dummy