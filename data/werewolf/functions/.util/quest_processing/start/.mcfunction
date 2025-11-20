## クエスト発生判定を更新
execute store result score #GameManager quest_timer run data get storage werewolf: settings.quest.interval

## 乱数生成
execute store result score #GameManager reserve_0 run random value 0..99

## 70%でクエスト実行
execute if score #GameManager reserve_0 matches 0..69 run function werewolf:.util/quest_processing/start/0