##スキル処理
# 通常
#クエスト用タイマーをロック
execute if entity @s[team=ojousama] run scoreboard players set #GameManager quest_timer -1
#クエストリセット
execute if entity @s[team=ojousama] run function werewolf:role/ojousama/skill/main_2 with storage werewolf: gamestate.quest
#演出
execute if entity @s[team=ojousama] run tellraw @a {"text":"お嬢様の鶴の一声でクエストが完了した。","color":"white"}
execute if entity @s[team=ojousama] run playsound minecraft:whistle master @a

# ダミー
execute if entity @s[team=!ojousama] run tellraw @s {"text":"お嬢様の鶴の一声でクエストが完了した。","color":"white"}
execute if entity @s[team=!ojousama] run playsound minecraft:whistle master @s