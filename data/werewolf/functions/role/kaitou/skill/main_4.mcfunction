##スキル処理
execute if data storage werewolf: role.kaitou.change_role run data modify storage werewolf: role.kaitou.change_role append value '{"text":", "}'

#加入するチームをリザルトのため記録
$data modify storage werewolf: role.kaitou.change_role append value '{"interpret":true,"nbt":"role.$(reserve_0).name","storage":"werewolf:","color":"#4e5c24"}'
#自分の名前を取得
function werewolf:.util/get_name/
#自分の名前をリザルトのため記録
data modify storage werewolf: role.kaitou.change_role append value '{"text":"   "}'
data modify storage werewolf: role.kaitou.change_role append from storage macro: reserve_0