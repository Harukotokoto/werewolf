##mob

##タスクの抽選漏れ

##タスク場所
#タスク場所にslime召喚
execute as @s[tag=active_task] run summon slime ~ ~ ~ {Size:0,Tags:["cave","task_mob"],Attributes:[{Name:"minecraft:generic.max_health",Base:2.0d}],PersistenceRequired:true,DeathLootTable:"werewolf:death_loot_table/task/emerald",Health:2f}

execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a

