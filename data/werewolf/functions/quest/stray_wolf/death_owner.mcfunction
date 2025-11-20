## オーナー死亡時に墓の近くに座らせる

#死亡プレイヤーにタグ付け
tag @s add search_wolf_owner

#狼側からOwnerをサーチ,tp
execute as @e[type=wolf,tag=quest_wolf] unless data entity @s {Sitting:1b} on owner as @s[tag=search_wolf_owner] run tag @e[type=wolf,tag=quest_wolf] add dead_owner
tp @e[type=wolf,tag=quest_wolf,tag=dead_owner] @a[tag=search_wolf_owner,limit=1]
data modify entity @e[type=wolf,tag=quest_wolf,tag=dead_owner,limit=1] Sitting set value true

#タグをおかたづけ
tag @s remove search_wolf_owner
tag @e[type=wolf,tag=quest_wolf,tag=dead_owner] remove dead_owner