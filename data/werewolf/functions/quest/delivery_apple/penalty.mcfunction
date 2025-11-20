## penalty
#アナウンス
tellraw @a {"text":"[システム] ペナルティ発生: お腹が空いた…"}
#ペナルティ実行
#満腹度-10(Level40で1秒につき満腹度1消費)
effect give @a[tag=!camp_wolf] hunger infinite 200 true