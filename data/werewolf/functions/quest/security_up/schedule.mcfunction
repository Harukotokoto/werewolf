## schedule
#死亡者発生時にアナウンス
execute as @e[type=area_effect_cloud,tag=death_announce] run return run function werewolf:quest/security_up/announce
#再帰処理
schedule function werewolf:quest/security_up/schedule 1t