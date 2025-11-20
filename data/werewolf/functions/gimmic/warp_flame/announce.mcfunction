## announce_active

execute as @s[tag=can_use_warp_flame] run title @s actionbar [{"text":"転移の炎に入る (役職本を持って\uE500長押し)"}]
execute as @s[tag=!can_use_warp_flame] run title @s actionbar [{"text":"転移の炎 (あなたには使えない)"}]