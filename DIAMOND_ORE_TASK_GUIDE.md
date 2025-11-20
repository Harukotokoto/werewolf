# ダイヤモンド鉱石タスク実装ガイド

## 概要

Villageマップに**夜専用のダイヤモンド鉱石タスク**を追加しました。

### タスク仕様
- **タイプ**: 採掘タスク（Switcherタスク）
- **出現時間**: 夜のみ
- **出現数**: 2箇所（マップ内から2箇所がランダムに選ばれる）
- **報酬**: エメラルド×5（確率100%）
- **必要アイテム**: 鉄のピッケル

## 実装済み内容

### 新規作成されたファイル（5個）
1. `data/werewolf/functions/task/field/village/set/diamond_ore.mcfunction`
2. `data/werewolf/functions/task/field/village/reward/diamond_ore.mcfunction`
3. `data/werewolf/item_modifiers/set_components/can_break/set_diamond_ore.json`
4. `data/werewolf/item_modifiers/set_components/can_break/set_ores.json`
5. `DIAMOND_ORE_TASK_GUIDE.md`

### 編集されたファイル（6個）
1. `data/werewolf/functions/task/field/village/set/.night.mcfunction`
2. `data/werewolf/functions/task/field/village/reward/.common.mcfunction`
3. `data/werewolf/functions/task/field/village/reset.mcfunction`
4. `data/werewolf/functions/task/switcher/on_player.mcfunction`
5. `data/werewolf/functions/task/field/village/.mcfunction`
6. `data/werewolf/functions/.install.mcfunction`

## タスクポイントの配置

マップ内にタスクポイントを配置してください：

```mcfunction
summon marker ~0.5 ~ ~0.5 {Tags:["village","task_point","diamond_ore"]}
```

**推奨配置数**: 20-30箇所（毎夜2箇所がランダムで選ばれます）

## テスト

```mcfunction
# データパックリロード
/reload

# マップ設定
data modify storage werewolf: settings.field set value "village"

# 夜タスク設置
function werewolf:task/set_night
```

