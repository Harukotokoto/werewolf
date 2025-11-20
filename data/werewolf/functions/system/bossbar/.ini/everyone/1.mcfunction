## bossbarの設定
$bossbar add personal_$(reserve_0) [{"text":""}]


## 詳細設定
$execute store result bossbar personal_$(reserve_0) max run scoreboard players get #GameManager common_timer
$execute store result bossbar personal_$(reserve_0) value run scoreboard players get #GameManager common_timer

## 表示
$bossbar set personal_$(reserve_0) players @s
$execute unless data storage werewolf: {phase:"playing"} run bossbar set personal_$(reserve_0) color pink