## warp_flame

##Lock
execute if data storage werewolf: {active_role_list:["ponkotsu"]} if data storage werewolf: role.ponkotsu{dummy_wolf:true} run return run function werewolf:gimmic/warp_flame/lock

##Active
#透明化
execute as @a[scores={is_sneaking=1..},tag=can_use_warp_flame,tag=camp_wolf] at @s if entity @e[type=marker,tag=warp_flame,distance=..1] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["warp_flame_key"]}] run summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:invisibility",amplifier:20b,duration:4,show_particles:0b,show_icon:1b}]}}
#個別のベント移動
execute as @a[scores={is_sneaking=30..},tag=can_use_warp_flame,tag=camp_wolf] at @s if entity @e[type=marker,tag=warp_flame,distance=..1] if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["warp_flame_key"]}] run function werewolf:gimmic/warp_flame/warp
#アナウンス
execute as @a at @s if entity @e[type=marker,tag=warp_flame,distance=..1] run function werewolf:gimmic/warp_flame/announce
#演出
execute at @e[type=marker,tag=warp_flame] run particle minecraft:trial_spawner_detection_ominous ~ ~ ~ 0.25 0.25 0.25 0 2 force @a