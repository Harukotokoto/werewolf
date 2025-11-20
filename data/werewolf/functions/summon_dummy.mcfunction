kill @e[type=frog,tag=player]
summon frog ~1 ~ ~ {Health:1f,NoAI:true,Silent:true,Tags:["camp_villager","player"],CustomNameVisible:1b,CustomName:'{"text":"村","color":"green"}'}
summon frog ~-1 ~ ~ {Health:1f,NoAI:true,Silent:true,Tags:["camp_wolf","player"],CustomNameVisible:1b,CustomName:'{"text":"狼","color":"red"}'}