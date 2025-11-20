# マップシステムガイド

## 目次
1. [マップシステムの概要](#マップシステムの概要)
2. [マップの構造](#マップの構造)
3. [タスクポイントの設置方法](#タスクポイントの設置方法)
4. [新規マップの追加手順](#新規マップの追加手順)
5. [タスクの種類と実装](#タスクの種類と実装)
6. [マップのカスタマイズ](#マップのカスタマイズ)
7. [トラブルシューティング](#トラブルシューティング)

---

## マップシステムの概要

### 現在実装されているマップ
1. **village** (村) - 7種類のタスク
2. **cave** (洞窟) - 3種類のタスク

### マップの選択
マップはストレージで管理されます：
```mcfunction
data storage werewolf: settings.field = "village"
data storage werewolf: settings.field = "cave"
```

### マップ切り替えの流れ
1. ストレージの`settings.field`を変更
2. ゲーム開始時に該当マップのタスク設置処理が実行される
3. タスク処理は常に現在のマップに応じて分岐される

---

## マップの構造

### ファイル構造

```
data/werewolf/functions/task/field/[マップ名]/
├── .mcfunction              # メイン処理（毎tick実行）
├── reset.mcfunction         # リセット処理
├── set/                     # タスク設置
│   ├── .day.mcfunction     # 昼タスク一括設置
│   ├── .night.mcfunction   # 夜タスク一括設置
│   └── [タスク名].mcfunction  # 個別タスク設置
└── reward/                  # タスク報酬
    ├── .common.mcfunction  # 共通報酬（採掘タスク用）
    ├── .1click.mcfunction  # 1クリックタスク報酬
    └── [タスク名].mcfunction  # 個別タスク報酬
```

### 統合ポイント

マップを統合するために以下のファイルを編集する必要があります：

#### 1. task/.mcfunction
```mcfunction
##フィールドごとに分岐
#village
execute if data storage werewolf: settings{field:"village"} run function werewolf:task/field/village/
#cave
execute if data storage werewolf: settings{field:"cave"} run function werewolf:task/field/cave/
# 新しいマップを追加する場合はここに追加
```

#### 2. task/set_day.mcfunction
```mcfunction
##フィールドごとに分岐
#village
execute if data storage werewolf: settings{field:"village"} run function werewolf:task/field/village/set/.day
#cave
execute if data storage werewolf: settings{field:"cave"} run function werewolf:task/field/cave/set/.day
# 新しいマップを追加する場合はここに追加
```

#### 3. task/set_night.mcfunction
```mcfunction
##フィールドごとに分岐
#village
execute if data storage werewolf: settings{field:"village"} run function werewolf:task/field/village/set/.night
#cave
execute if data storage werewolf: settings{field:"cave"} run function werewolf:task/field/cave/set/.night
# 新しいマップを追加する場合はここに追加
```

#### 4. task/reset.mcfunction
```mcfunction
##フィールドごとの処理
#village
function werewolf:task/field/village/reset
#cave
function werewolf:task/field/cave/reset
# 新しいマップを追加する場合はここに追加
```

#### 5. task/reward/.common.mcfunction
```mcfunction
##フィールドごとの処理
#village
execute if data storage werewolf: settings{field:"village"} run function werewolf:task/field/village/reward/.common
#cave
execute if data storage werewolf: settings{field:"cave"} run function werewolf:task/field/cave/reward/.common
# 新しいマップを追加する場合はここに追加
```

#### 6. task/reward/.1click.mcfunction
```mcfunction
##フィールドごとの処理
#village
execute if data storage werewolf: settings{field:"village"} run function werewolf:task/field/village/reward/.1click
#cave
execute if data storage werewolf: settings{field:"cave"} run function werewolf:task/field/cave/reward/.1click
# 新しいマップを追加する場合はここに追加
```

#### 7. system/phase/playing.mcfunction（オプション）
マップ固有の処理がある場合：
```mcfunction
## フィールド固有
execute if data storage werewolf: settings{field:"village"} run function werewolf:system/phase/playing/field/village/
execute if data storage werewolf: settings{field:"cave"} run function werewolf:system/phase/playing/field/cave/
# 新しいマップを追加する場合はここに追加
```

---

## タスクポイントの設置方法

### タスクポイントとは
タスクポイントは`marker`エンティティで、マップ内のタスクが発生する位置を示します。

### タグの命名規則
タスクポイントには以下のタグが必要です：

1. **マップ識別タグ**: `village`, `cave`, `[新しいマップ名]`
2. **タイプタグ**: `task_point` (必須)
3. **タスク種類タグ**: `oak_log`, `iron_ore`, `wheat`, `mob` など
4. **特殊タグ**: 
   - `night_task` - 夜専用タスク
   - `active_task` - アクティブなタスク（ランダム選択で付与される）

### タスクポイントの召喚コマンド例

#### 採掘タスク（oak_log）の場合
```mcfunction
summon marker ~0.5 ~ ~0.5 {Tags:["village","task_point","oak_log"]}
```

#### 1クリックタスク（wheat）の場合
```mcfunction
summon marker ~0.5 ~ ~0.5 {Tags:["village","task_point","wheat"]}
```

#### 夜タスク（cornflower）の場合
```mcfunction
summon marker ~0.5 ~ ~0.5 {Tags:["village","task_point","night_task"]}
```

#### モブタスク（mob）の場合
```mcfunction
summon marker ~ ~ ~ {Tags:["cave","task_point","mob"]}
```

### タスクポイントの配置
1. マップを開く
2. タスクを設置したい場所でコマンドを実行
3. 複数のタスクポイントを配置（推奨: 20-50箇所）
4. ランダム性を高めるため、同じ種類のタスクを広範囲に分散配置

---

## 新規マップの追加手順

### ステップ1: ディレクトリ構造の作成

新しいマップ名を`example`とした場合：

```
data/werewolf/functions/task/field/example/
├── .mcfunction
├── reset.mcfunction
├── set/
│   ├── .day.mcfunction
│   ├── .night.mcfunction
│   └── [各タスク].mcfunction
└── reward/
    ├── .common.mcfunction
    ├── .1click.mcfunction
    └── [各タスク].mcfunction
```

### ステップ2: タスクポイントの配置

マップ内に`marker`エンティティを配置：

```mcfunction
# 例: 木材タスクポイントを30箇所配置
summon marker X Y Z {Tags:["example","task_point","oak_log"]}
```

### ステップ3: reset.mcfunctionの作成

```mcfunction
##ブロックを設置
execute as @e[type=marker,tag=example,tag=task_point,tag=oak_log] at @s run setblock ~ ~ ~ oak_log
execute as @e[type=marker,tag=example,tag=task_point,tag=wheat] at @s align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:wheat",Properties:{age:"7"}},Tags:["dummy_task"]}
execute as @e[type=marker,tag=example,tag=task_point,tag=night_task] at @s run setblock ~ ~ ~ air
```

### ステップ4: set/.day.mcfunctionの作成

```mcfunction
##初期化
function werewolf:task/reset

##タスク数設定
tag @e[type=marker,tag=example,tag=task_point,tag=oak_log,sort=random,limit=15] add active_task
tag @e[type=marker,tag=example,tag=task_point,tag=wheat,sort=random,limit=15] add active_task

##個別処理
execute as @e[type=marker,tag=example,tag=task_point,tag=oak_log] at @s run function werewolf:task/field/example/set/oak_log
execute as @e[type=marker,tag=example,tag=task_point,tag=wheat] at @s run function werewolf:task/field/example/set/wheat
```

### ステップ5: set/.night.mcfunctionの作成

```mcfunction
##タスク数設定
tag @e[type=marker,tag=example,tag=task_point,tag=night_task,sort=random,limit=10] add active_task

##個別処理
execute as @e[type=marker,tag=example,tag=task_point,tag=night_task] at @s run function werewolf:task/field/example/set/cornflower
```

### ステップ6: 個別タスク設置処理の作成

#### set/oak_log.mcfunction（採掘タスク）

```mcfunction
##oak_log

##タスクの抽選漏れ
execute as @s[tag=!active_task] run setblock ~ ~ ~ barrier
execute as @s[tag=!active_task] align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {item:{id:"minecraft:oak_log",Count:1b},Tags:["dummy_task"]}

##タスク場所
#タスク場所にタスクを設置
execute as @s[tag=active_task] unless block ~ ~ ~ minecraft:oak_log run setblock ~ ~ ~ minecraft:oak_log
#タスクが見やすいようディスプレイ表示
execute as @s[tag=active_task] align xyz run summon minecraft:item_display ~0.5 ~500.5 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":100}},view_range:10f,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0.001f,-499.999f,0.001f]},brightness:{block:10,sky:10},Tags:["select_block"]}
#スイッチャーを設置
execute as @s[tag=active_task] align xyz positioned ~0.5 ~-0.0001 ~0.5 run summon interaction ~ ~ ~ {Tags:["task_switcher"],width:1.001f,height:1.001f}
#パーティクル表示
execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
```

#### set/wheat.mcfunction（1クリックタスク）

```mcfunction
##wheat

##タスクの抽選漏れ
execute at @s[tag=!active_task] align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:wheat",Properties:{age:"7"}},Tags:["dummy_task"]}

##タスク場所
#タスク場所にタスクを設置
execute as @s[tag=active_task] at @s unless block ~ ~ ~ minecraft:wheat run setblock ~ ~ ~ wheat[age=7]
execute as @s[tag=active_task] at @s align xyz run summon interaction ~0.5 ~ ~0.5 {Tags:["1click_task","wheat"],width:1.1f,height:1.1f}
#タスクが見やすいようディスプレイ表示
execute as @s[tag=active_task] align xyz run summon minecraft:item_display ~0.5 ~500.5 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":100}},view_range:10f,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0.001f,-499.999f,0.001f]},brightness:{block:10,sky:10},Tags:["select_block"]}
#パーティクル表示
execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
```

#### set/cornflower.mcfunction（夜タスク）

```mcfunction
##cornflower

##タスクの抽選漏れ

##タスク場所
#タスク場所にタスクを設置
execute at @s[tag=active_task] align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:cornflower"},Tags:["night_task"]}
execute as @s[tag=active_task] at @s align xyz run summon interaction ~0.5 ~ ~0.5 {Tags:["1click_task","night_task"],width:1.1f,height:1.1f}
execute at @s[tag=active_task] run setblock ~ ~ ~ light[level=8]
#タスクが見やすいようディスプレイ表示
execute as @s[tag=active_task] align xyz run summon minecraft:item_display ~0.5 ~500.5 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":101}},view_range:10f,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0.001f,-499.999f,0.001f]},brightness:{block:10,sky:10},Tags:["select_block"]}
#パーティクル表示
execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
```

### ステップ7: 報酬処理の作成

#### reward/.common.mcfunction（採掘タスク用）

```mcfunction
execute as @a[scores={mined.oak_log=1..}] run function werewolf:task/field/example/reward/oak_log

scoreboard players set @a mined.oak_log 0
```

#### reward/.1click.mcfunction（1クリックタスク用）

```mcfunction
##reward処理
execute as @s[tag=wheat] if data entity @s attack.player run function werewolf:task/field/example/reward/wheat
execute as @s[tag=night_task] if data entity @s attack.player run function werewolf:task/field/example/reward/cornflower

data remove entity @s attack.player
data remove entity @s interaction.player
```

#### reward/oak_log.mcfunction（個別報酬）

```mcfunction
##報酬
execute store result score #GameManager reserve_0 run random value 0..9
execute if score #GameManager reserve_0 matches ..2 run give @s emerald 1
```

#### reward/wheat.mcfunction（個別報酬）

```mcfunction
##報酬
execute store result score #GameManager reserve_0 run random value 0..9
execute on attacker if score #GameManager reserve_0 matches ..2 run give @s emerald 1

##消滅処理
execute align xyz positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
setblock ~ ~ ~ air destroy
kill @s
```

#### reward/cornflower.mcfunction（夜タスク報酬）

```mcfunction
##報酬
execute on attacker run give @s emerald 1

##消滅処理
execute align xyz positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
kill @e[type=block_display,tag=night_task,distance=..0.5]
setblock ~ ~ ~ air
kill @s
```

### ステップ8: .mcfunctionの作成（メイン処理）

villageマップの処理をコピーして、マップ名を変更：

```mcfunction
## タスク関連

##1clickタスク
#タスク用のinteraction処理
execute as @e[type=minecraft:interaction,tag=1click_task] at @s if data entity @s attack.player run function werewolf:task/reward/.1click
execute as @e[type=minecraft:interaction,tag=1click_task] at @s if data entity @s interaction.player run function werewolf:task/reward/.1click

##要Switcherタスク
#タスク報酬
function werewolf:task/reward/.common
#scoreboard減算
execute as @a[scores={can_mining_task=1..}] run scoreboard players remove @s can_mining_task 1
execute as @e[type=interaction,tag=task_switcher,scores={can_mining_task=1..}] run scoreboard players remove @s can_mining_task 1
#タスクを破壊可能にする処理
execute as @e[type=interaction,tag=task_switcher] if data entity @s attack.player run function werewolf:task/switcher/on_switcher
#タスクを破壊不可にする処理
execute as @a[scores={can_mining_task=0}] if data entity @s SelectedItem.components."minecraft:can_break".predicates[{blocks:"minecraft:oak_log"}] run item modify entity @s weapon.mainhand werewolf:set_components/can_break/remove
execute as @a[scores={can_mining_task=0}] if data entity @s SelectedItem.components."minecraft:can_break".predicates[{blocks:"minecraft:iron_ore"}] run item modify entity @s weapon.mainhand werewolf:set_components/can_break/remove
execute as @e[type=interaction,tag=task_switcher,scores={can_mining_task=0}] run function werewolf:task/switcher/off_switcher
#消化済みタスク削除
execute as @e[type=marker,tag=active_task,tag=oak_log] at @s align xyz unless block ~ ~ ~ minecraft:oak_log positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]

##夜タスク
#particle
execute if data storage werewolf: gamestate.time{id:night} as @e[type=marker,tag=task_point,tag=active_task,tag=night_task] at @s if entity @e[type=interaction,tag=1click_task,distance=..1] align xyz run particle minecraft:ominous_spawning ~0.5 ~0.5 ~0.5 0.5 0.5 0.5 0 1 force @a
```

### ステップ9: 統合ファイルの編集

前述の「統合ポイント」セクションの6つのファイルに新しいマップの処理を追加します。

### ステップ10: テスト

1. マップを選択:
```mcfunction
data modify storage werewolf: settings.field set value "example"
```

2. タスクのリセット:
```mcfunction
function werewolf:task/reset
```

3. 昼タスクの設置:
```mcfunction
function werewolf:task/set_day
```

4. 夜タスクの設置:
```mcfunction
function werewolf:task/set_night
```

---

## タスクの種類と実装

### 1. 採掘タスク（Switcherタスク）

**特徴**:
- プレイヤーがブロックを攻撃してスイッチをON
- 25tick間ブロックを破壊可能
- 破壊すると報酬

**必要なもの**:
- タスクポイント（marker）
- task_switcher（interaction）
- select_block（item_display）
- 実際のブロック

**スコアボード**:
- `can_mining_task` - 破壊可能時間

**対応ブロック**:
- oak_log（オークの原木）
- iron_ore（鉄鉱石）

### 2. 1クリックタスク

**特徴**:
- interactionエンティティを攻撃/インタラクトするだけで完了
- 即座に報酬を獲得

**必要なもの**:
- タスクポイント（marker）
- 1click_task（interaction）
- select_block（item_display）
- 視覚用block/item

**対応タスク**:
- wheat（小麦）
- red_mushroom（赤キノコ）
- brown_mushroom（茶キノコ）
- cornflower（ヤグルマギク・夜専用）

### 3. インタラクションタスク

**特徴**:
- interactionエンティティとインタラクトして完了
- アニメーションやモデルが使用される場合がある

**必要なもの**:
- タスクポイント（marker）
- interaction
- animated_javaモデル（オプション）

**対応タスク**:
- treasure_chest（宝箱）

### 4. モブ討伐タスク

**特徴**:
- モブを倒すと報酬
- DeathLootTableで報酬設定

**必要なもの**:
- タスクポイント（marker）
- モブエンティティ（tags: ["task_mob"]）

**対応タスク**:
- mob（スライム）

---

## マップのカスタマイズ

### タスク数の調整

`set/.day.mcfunction`または`set/.night.mcfunction`で調整：

```mcfunction
# 15個から30個に変更
tag @e[type=marker,tag=example,tag=task_point,tag=oak_log,sort=random,limit=30] add active_task
```

### 報酬の調整

個別のrewardファイルで調整：

```mcfunction
# 確率を30%から50%に変更
execute store result score #GameManager reserve_0 run random value 0..9
execute if score #GameManager reserve_0 matches ..4 run give @s emerald 1

# 報酬を2個に変更
execute on attacker run give @s emerald 2

# 報酬を別のアイテムに変更
execute on attacker run give @s diamond 1
```

### 新しいタスクタイプの追加

1. 新しいタグを定義（例: `golden_apple`）
2. タスクポイントを配置
3. set/[タスク名].mcfunctionを作成
4. reward/[タスク名].mcfunctionを作成
5. .day.mcfunctionまたは.night.mcfunctionに統合

### マップ固有の処理

`system/phase/playing/field/[マップ名]/`ディレクトリを作成して、マップ固有の処理を追加できます。

例：
```
system/phase/playing/field/example/
└── .mcfunction
```

---

## トラブルシューティング

### タスクが表示されない

**原因**:
- タスクポイントが配置されていない
- マップ名のタグが間違っている
- active_taskタグが付与されていない

**解決方法**:
```mcfunction
# タスクポイントの確認
execute as @e[type=marker,tag=task_point] run say タスクポイント発見

# タグの確認
data get entity @e[type=marker,limit=1] Tags
```

### タスクが破壊できない（採掘タスク）

**原因**:
- スイッチャーが機能していない
- can_breakが設定されていない
- can_mining_taskスコアが0

**解決方法**:
```mcfunction
# スコアの確認
scoreboard players get @s can_mining_task

# can_breakの確認
data get entity @s SelectedItem.components."minecraft:can_break"
```

### 報酬が獲得できない

**原因**:
- 報酬処理が呼び出されていない
- スコアボードがリセットされていない
- 確率判定で外れている

**解決方法**:
```mcfunction
# 確率を100%にしてテスト
give @s emerald 1

# スコアボードの確認
scoreboard players get @s mined.oak_log
```

### 夜タスクが昼に表示される

**原因**:
- .night.mcfunctionが.day.mcfunctionで呼び出されている
- night_taskタグが付与されていない

**解決方法**:
- タグの確認
- set/.day.mcfunctionとset/.night.mcfunctionの分離

### マップが切り替わらない

**原因**:
- ストレージの設定が間違っている
- 統合ファイルに追加されていない

**解決方法**:
```mcfunction
# ストレージの確認
data get storage werewolf: settings.field

# 手動で設定
data modify storage werewolf: settings.field set value "example"
```

---

## 参考資料

- **VILLAGE_MAP_REFERENCE.md** - 村マップの完全な実装例
- **DATAPACK_STRUCTURE.md** - 全ファイルの構造
- **SYSTEM_OVERVIEW.md** - システム全体の概要

---

このガイドに従えば、既存のvillageマップやcaveマップと同様の新しいマップを追加できます。

