##全プレイヤーのエフェクトを解除
effect clear @a[tag=player] blindness
effect clear @a[tag=player] glowing
effect clear @a[tag=player] invisibility
effect clear @a[tag=player] speed
effect clear @a[tag=player] poison
effect clear @a[tag=player] slowness
effect clear @a[tag=player] regeneration
effect clear @a[tag=player] darkness

##アナウンス
execute as @a run title @a title [{"text":"全てのエフェクトが解除された！","color":"gold"}]

##アイテム使用者のmainhandをairに
item replace entity @s weapon.mainhand with air

