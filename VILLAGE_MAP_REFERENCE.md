# Villageマップ実装リファレンス

## 目次
1. [概要](#概要)
2. [タスク一覧](#タスク一覧)
3. [ファイル構造](#ファイル構造)
4. [完全なコード解説](#完全なコード解説)
5. [タスクフロー](#タスクフロー)
6. [カスタマイズ例](#カスタマイズ例)

---

## 概要

### Villageマップの特徴
- **昼タスク**: 6種類（採掘×2、1クリック×3、インタラクション×1）
- **夜タスク**: 1種類（1クリック）
- **合計タスクポイント数**: 推奨80個以上
- **同時アクティブタスク数**: 昼75個、夜10個

### マップ設定
```mcfunction
data modify storage werewolf: settings.field set value "village"
```

---

## タスク一覧

### 昼タスク

#### 1. oak_log（オークの原木）
- **タイプ**: 採掘タスク（Switcher）
- **アクティブ数**: 15個
- **報酬**: エメラルド×1（確率30%）
- **必要アイテム**: 鉄の斧
- **タグ**: `village`, `task_point`, `oak_log`

#### 2. iron_ore（鉄鉱石）
- **タイプ**: 採掘タスク（Switcher）
- **アクティブ数**: 15個
- **報酬**: エメラルド×1（確率30%）
- **必要アイテム**: 鉄のピッケル
- **タグ**: `village`, `task_point`, `iron_ore`

#### 3. wheat（小麦）
- **タイプ**: 1クリックタスク
- **アクティブ数**: 15個
- **報酬**: エメラルド×1（確率30%）
- **タグ**: `village`, `task_point`, `wheat`

#### 4. red_mushroom（赤キノコ）
- **タイプ**: 1クリックタスク
- **アクティブ数**: 15個
- **報酬**: エメラルド×1（確率30%）
- **タグ**: `village`, `task_point`, `red_mushroom`

#### 5. brown_mushroom（茶キノコ）
- **タイプ**: 1クリックタスク
- **アクティブ数**: 15個
- **報酬**: エメラルド×1（確率30%）
- **タグ**: `village`, `task_point`, `brown_mushroom`

#### 6. treasure_chest（宝箱）
- **タイプ**: インタラクションタスク
- **アクティブ数**: 5個
- **報酬**: カスタム報酬
- **タグ**: `village`, `task_point`, `treasure_chest`

### 夜タスク

#### 7. cornflower（ヤグルマギク）
- **タイプ**: 1クリックタスク
- **アクティブ数**: 10個
- **報酬**: エメラルド×1（確率100%）
- **タグ**: `village`, `task_point`, `night_task`
- **特徴**: 光レベル8のライトブロックを設置

---

## ファイル構造

```
data/werewolf/functions/task/field/village/
├── .mcfunction                          # メイン処理（毎tick）
├── reset.mcfunction                     # リセット処理
├── set/                                 # タスク設置処理
│   ├── .day.mcfunction                 # 昼タスク一括設置
│   ├── .night.mcfunction               # 夜タスク一括設置
│   ├── oak_log.mcfunction              # オークの原木設置
│   ├── iron_ore.mcfunction             # 鉄鉱石設置
│   ├── wheat.mcfunction                # 小麦設置
│   ├── red_mushroom.mcfunction         # 赤キノコ設置
│   ├── brown_mushroom.mcfunction       # 茶キノコ設置
│   ├── treasure_chest.mcfunction       # 宝箱設置
│   └── cornflower.mcfunction           # ヤグルマギク設置（夜）
└── reward/                              # 報酬処理
    ├── .common.mcfunction              # 共通報酬（採掘タスク）
    ├── .1click.mcfunction              # 1クリックタスク報酬
    ├── oak_log.mcfunction              # オークの原木報酬
    ├── iron_ore.mcfunction             # 鉄鉱石報酬
    ├── wheat.mcfunction                # 小麦報酬
    ├── red_mushroom.mcfunction         # 赤キノコ報酬
    ├── brown_mushroom.mcfunction       # 茶キノコ報酬
    ├── treasure_chest.mcfunction       # 宝箱報酬
    └── cornflower.mcfunction           # ヤグルマギク報酬
```

---

## 完全なコード解説

### reset.mcfunction

```mcfunction
##ブロックを設置
execute as @e[type=marker,tag=village,tag=task_point,tag=oak_log] at @s run setblock ~ ~ ~ oak_log
execute as @e[type=marker,tag=village,tag=task_point,tag=iron_ore] at @s run setblock ~ ~ ~ stone
execute as @e[type=marker,tag=village,tag=task_point,tag=wheat] at @s align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:wheat",Properties:{age:"7"}},Tags:["dummy_task"]}
execute as @e[type=marker,tag=village,tag=task_point,tag=red_mushroom] at @s align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:red_mushroom"},Tags:["dummy_task"]}
execute as @e[type=marker,tag=village,tag=task_point,tag=brown_mushroom] at @s align xyz run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:brown_mushroom"},Tags:["dummy_task"]}
execute as @e[type=marker,tag=village,tag=task_point,tag=night_task] at @s run setblock ~ ~ ~ air
```

**処理内容**:
1. オークの原木タスクポイントに原木ブロックを設置
2. 鉄鉱石タスクポイントに石ブロックを設置（dummy）
3. 小麦タスクポイントにブロックディスプレイを召喚（成長した小麦）
4. 赤キノコタスクポイントにブロックディスプレイを召喚
5. 茶キノコタスクポイントにブロックディスプレイを召喚
6. 夜タスクポイントを空気ブロックで初期化

**注意点**:
- ブロックディスプレイは`dummy_task`タグで管理
- 鉄鉱石はダミーとして石ブロックを使用（実際のタスクで鉄鉱石に変更）

---

### set/.day.mcfunction

```mcfunction
##初期化
function werewolf:task/reset

##タスク数設定
tag @e[type=marker,tag=village,tag=task_point,tag=oak_log,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=iron_ore,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=wheat,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=red_mushroom,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=brown_mushroom,sort=random,limit=15] add active_task
tag @e[type=marker,tag=village,tag=task_point,tag=treasure_chest,sort=random,limit=5] add active_task

##個別処理
execute as @e[type=marker,tag=village,tag=task_point,tag=oak_log] at @s run function werewolf:task/field/village/set/oak_log
execute as @e[type=marker,tag=village,tag=task_point,tag=iron_ore] at @s run function werewolf:task/field/village/set/iron_ore
execute as @e[type=marker,tag=village,tag=task_point,tag=wheat] at @s run function werewolf:task/field/village/set/wheat
execute as @e[type=marker,tag=village,tag=task_point,tag=red_mushroom] at @s run function werewolf:task/field/village/set/red_mushroom
execute as @e[type=marker,tag=village,tag=task_point,tag=brown_mushroom] at @s run function werewolf:task/field/village/set/brown_mushroom
execute as @e[type=marker,tag=village,tag=task_point,tag=treasure_chest] at @s run function werewolf:task/field/village/set/treasure_chest
```

**処理内容**:
1. 全タスクをリセット
2. 各タスク種類からランダムに指定数を選択し`active_task`タグを付与
3. 全タスクポイントに対して個別設置処理を実行

**ランダム選択の仕組み**:
- `sort=random` でランダムソート
- `limit=15` で上位15個を選択
- 選ばれたものに`active_task`タグが付与される

---

### set/.night.mcfunction

```mcfunction
##タスク数設定
tag @e[type=marker,tag=village,tag=task_point,tag=night_task,sort=random,limit=10] add active_task

##個別処理
execute as @e[type=marker,tag=village,tag=task_point,tag=night_task] at @s run function werewolf:task/field/village/set/cornflower
```

**処理内容**:
1. 夜タスクポイントからランダムに10個を選択
2. 全夜タスクポイントに対してcornflower設置処理を実行

**昼との違い**:
- リセット処理を呼び出さない（昼のタスクはそのまま残る）
- 夜タスクのみを追加

---

### set/oak_log.mcfunction（採掘タスクの例）

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

**処理内容**:

#### 抽選漏れの処理（active_taskタグがない場合）
1. バリアブロックを設置（プレイヤーが通れないようにする）
2. アイテムディスプレイで原木を表示（dummy_task）

#### アクティブタスクの処理（active_taskタグがある場合）
1. 原木ブロックを設置
2. タスク選択用のディスプレイを召喚
   - Y+500の位置に召喚
   - transformationで実際の位置（Y-499.999）に表示
   - custom_model_data: 100 を使用
   - 明るさ固定（block:10, sky:10）
3. interactionエンティティを召喚（task_switcher）
   - プレイヤーの攻撃を検知
   - サイズ: 1.001×1.001（ブロックより少し大きい）
4. cloudパーティクルを表示

**select_blockのトリック**:
- Y+500に召喚してtransformationで実際の位置に表示
- これにより、実際のブロックと干渉しない
- プレイヤーからは正常な位置に見える

---

### set/wheat.mcfunction（1クリックタスクの例）

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

**処理内容**:

#### 抽選漏れの処理
- ブロックディスプレイで成長した小麦を表示

#### アクティブタスクの処理
1. 成長した小麦ブロックを設置
2. interactionエンティティを召喚（1click_task + wheat）
3. タスク選択用のディスプレイを召喚
4. cloudパーティクルを表示

**採掘タスクとの違い**:
- task_switcherではなく1click_task
- 追加のタグ（wheat）で識別

---

### set/cornflower.mcfunction（夜タスクの例）

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

**処理内容**:
1. ブロックディスプレイでヤグルマギクを表示（night_task）
2. interactionエンティティを召喚（1click_task + night_task）
3. 光レベル8のライトブロックを設置（夜でも見やすくする）
4. タスク選択用のディスプレイを召喚（custom_model_data: 101）
5. cloudパーティクルを表示

**夜タスクの特徴**:
- 抽選漏れの処理なし（夜タスクポイントは全て使用可能）
- ライトブロックで照明
- custom_model_data: 101（昼と区別）

---

### .mcfunction（メイン処理）

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
execute as @e[type=marker,tag=active_task,tag=iron_ore] at @s align xyz unless block ~ ~ ~ minecraft:iron_ore positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]

##夜タスク
#particle
execute if data storage werewolf: gamestate.time{id:night} as @e[type=marker,tag=task_point,tag=active_task,tag=night_task] at @s if entity @e[type=interaction,tag=1click_task,distance=..1] align xyz run particle minecraft:ominous_spawning ~0.5 ~0.5 ~0.5 0.5 0.5 0.5 0 1 force @a
```

**処理内容**:

#### 1クリックタスク処理
- attack.playerまたはinteraction.playerがあれば報酬処理を呼び出し

#### Switcherタスク処理
1. 共通報酬処理を呼び出し
2. can_mining_taskスコアを減算（プレイヤーとswitcher両方）
3. switcherが攻撃されたらON処理
4. can_mining_taskが0になったらcan_breakを削除
5. can_mining_taskが0になったらswitcherをOFF

#### 消化済みタスク削除
- ブロックが存在しない場合、select_blockを削除

#### 夜タスク
- 夜の間、アクティブな夜タスクにominous_spawningパーティクルを表示

---

### reward/.common.mcfunction

```mcfunction
execute as @a[scores={mined.oak_log=1..}] run function werewolf:task/field/village/reward/oak_log
execute as @a[scores={mined.iron_ore=1..}] run function werewolf:task/field/village/reward/iron_ore


scoreboard players set @a mined.oak_log 0
scoreboard players set @a mined.iron_ore 0

```

**処理内容**:
1. 原木を採掘したプレイヤーに報酬
2. 鉄鉱石を採掘したプレイヤーに報酬
3. スコアをリセット

**スコアボードの仕組み**:
- `mined.oak_log`: `minecraft.mined:minecraft.oak_log`を監視
- `mined.iron_ore`: `minecraft.mined:minecraft.iron_ore`を監視
- バニラの統計機能を利用

---

### reward/.1click.mcfunction

```mcfunction
##reward処理
execute as @s[tag=wheat] if data entity @s attack.player run function werewolf:task/field/village/reward/wheat
execute as @s[tag=red_mushroom] if data entity @s attack.player run function werewolf:task/field/village/reward/red_mushroom
execute as @s[tag=brown_mushroom] if data entity @s attack.player run function werewolf:task/field/village/reward/brown_mushroom
execute as @s[tag=night_task] if data entity @s attack.player run function werewolf:task/field/village/reward/cornflower
execute as @s[tag=treasure_chest] if data entity @s interaction.player run function werewolf:task/field/village/reward/treasure_chest

data remove entity @s attack.player
data remove entity @s interaction.player
```

**処理内容**:
1. タグによって報酬処理を分岐
2. attack.playerまたはinteraction.playerの存在を確認
3. NBTデータをクリア

**タグによる識別**:
- wheat, red_mushroom, brown_mushroom, night_task, treasure_chestで識別
- 同じinteractionでも異なる報酬処理を実行

---

### reward/oak_log.mcfunction（採掘タスク報酬の例）

```mcfunction
##報酬
execute store result score #GameManager reserve_0 run random value 0..9
execute if score #GameManager reserve_0 matches ..2 run give @s emerald 1
```

**処理内容**:
1. 0-9のランダム値を生成
2. 0-2の場合（30%）エメラルドを付与

**確率の仕組み**:
- random value 0..9: 0,1,2,3,4,5,6,7,8,9の10通り
- matches ..2: 0,1,2の3通り
- 確率: 3/10 = 30%

---

### reward/wheat.mcfunction（1クリックタスク報酬の例）

```mcfunction
##報酬
execute store result score #GameManager reserve_0 run random value 0..9
execute on attacker if score #GameManager reserve_0 matches ..2 run give @s emerald 1

##消滅処理
execute align xyz positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
setblock ~ ~ ~ air destroy
kill @s
```

**処理内容**:
1. 30%の確率で攻撃者にエメラルドを付与
2. select_blockを削除
3. 小麦ブロックを破壊（destroyでアイテム化）
4. interaction自身を削除

**on attackerの使用**:
- interactionのattack.playerから攻撃者のコンテキストに切り替え
- 攻撃者に直接アイテムを付与できる

---

### reward/cornflower.mcfunction（夜タスク報酬の例）

```mcfunction
##報酬
execute on attacker run give @s emerald 1

##消滅処理
execute align xyz positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
kill @e[type=block_display,tag=night_task,distance=..0.5]
setblock ~ ~ ~ air
kill @s
```

**処理内容**:
1. 100%の確率で攻撃者にエメラルドを付与
2. select_blockを削除
3. block_displayを削除
4. ライトブロックを削除
5. interaction自身を削除

**夜タスクの特徴**:
- 報酬が確定（100%）
- block_displayの削除が必要
- ライトブロックの削除が必要

---

## タスクフロー

### 採掘タスク（oak_log）のフロー

```
1. ゲーム開始
   ↓
2. set/.day.mcfunction実行
   ↓
3. タスクポイントからランダムに15個選択 → active_taskタグ付与
   ↓
4. set/oak_log.mcfunction実行
   ├─ active_task: 原木ブロック + interaction + select_block召喚
   └─ !active_task: バリアブロック + dummy表示
   ↓
5. プレイヤーがinteractionを攻撃
   ↓
6. task/switcher/on_switcher実行
   ├─ can_mining_task = 25設定
   ├─ 斧にcan_break付与
   └─ interactionサイズ縮小
   ↓
7. プレイヤーが原木を破壊（25tick以内）
   ↓
8. mined.oak_log = 1
   ↓
9. reward/.common.mcfunction実行
   ↓
10. reward/oak_log.mcfunction実行
    └─ 30%の確率でエメラルド付与
    ↓
11. mined.oak_log = 0にリセット
    ↓
12. 原木がない → select_block削除
```

### 1クリックタスク（wheat）のフロー

```
1. ゲーム開始
   ↓
2. set/.day.mcfunction実行
   ↓
3. タスクポイントからランダムに15個選択 → active_taskタグ付与
   ↓
4. set/wheat.mcfunction実行
   ├─ active_task: 小麦ブロック + interaction + select_block召喚
   └─ !active_task: dummy表示
   ↓
5. プレイヤーがinteractionを攻撃
   ↓
6. .mcfunction（メイン処理）で検知
   ↓
7. reward/.1click.mcfunction実行
   ↓
8. タグ（wheat）で判定
   ↓
9. reward/wheat.mcfunction実行
   ├─ 30%の確率でエメラルド付与
   ├─ select_block削除
   ├─ 小麦ブロック破壊
   └─ interaction削除
```

### 夜タスク（cornflower）のフロー

```
1. 夜になる
   ↓
2. set/.night.mcfunction実行
   ↓
3. 夜タスクポイントからランダムに10個選択 → active_taskタグ付与
   ↓
4. set/cornflower.mcfunction実行
   └─ active_task: block_display + interaction + light + select_block召喚
   ↓
5. .mcfunction（メイン処理）でパーティクル表示
   ↓
6. プレイヤーがinteractionを攻撃
   ↓
7. reward/.1click.mcfunction実行
   ↓
8. タグ（night_task）で判定
   ↓
9. reward/cornflower.mcfunction実行
   ├─ 100%でエメラルド付与
   ├─ select_block削除
   ├─ block_display削除
   ├─ lightブロック削除
   └─ interaction削除
   ↓
10. 朝になる
    ↓
11. reset.mcfunction実行
    └─ 残った夜タスクを削除
```

---

## カスタマイズ例

### 例1: タスク数を増やす

**変更ファイル**: `set/.day.mcfunction`

```mcfunction
# 変更前
tag @e[type=marker,tag=village,tag=task_point,tag=oak_log,sort=random,limit=15] add active_task

# 変更後（30個に増やす）
tag @e[type=marker,tag=village,tag=task_point,tag=oak_log,sort=random,limit=30] add active_task
```

### 例2: 報酬を増やす

**変更ファイル**: `reward/oak_log.mcfunction`

```mcfunction
# 変更前（30%で1個）
execute store result score #GameManager reserve_0 run random value 0..9
execute if score #GameManager reserve_0 matches ..2 run give @s emerald 1

# 変更後（100%で2個）
give @s emerald 2
```

### 例3: 報酬の確率を変更

**変更ファイル**: `reward/wheat.mcfunction`

```mcfunction
# 変更前（30%）
execute store result score #GameManager reserve_0 run random value 0..9
execute on attacker if score #GameManager reserve_0 matches ..2 run give @s emerald 1

# 変更後（50%）
execute store result score #GameManager reserve_0 run random value 0..9
execute on attacker if score #GameManager reserve_0 matches ..4 run give @s emerald 1
```

### 例4: 新しいタスクを追加（例: diamond_ore）

#### 1. タスクポイントを配置
```mcfunction
summon marker X Y Z {Tags:["village","task_point","diamond_ore"]}
```

#### 2. set/.day.mcfunctionに追加
```mcfunction
tag @e[type=marker,tag=village,tag=task_point,tag=diamond_ore,sort=random,limit=5] add active_task
execute as @e[type=marker,tag=village,tag=task_point,tag=diamond_ore] at @s run function werewolf:task/field/village/set/diamond_ore
```

#### 3. set/diamond_ore.mcfunctionを作成
```mcfunction
##diamond_ore

##タスクの抽選漏れ
execute as @s[tag=!active_task] run setblock ~ ~ ~ barrier
execute as @s[tag=!active_task] align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {item:{id:"minecraft:diamond_ore",Count:1b},Tags:["dummy_task"]}

##タスク場所
execute as @s[tag=active_task] unless block ~ ~ ~ minecraft:diamond_ore run setblock ~ ~ ~ minecraft:diamond_ore
execute as @s[tag=active_task] align xyz run summon minecraft:item_display ~0.5 ~500.5 ~0.5 {item:{id:"minecraft:dirt",components:{"minecraft:custom_model_data":100}},view_range:10f,transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1],translation:[0.001f,-499.999f,0.001f]},brightness:{block:10,sky:10},Tags:["select_block"]}
execute as @s[tag=active_task] align xyz positioned ~0.5 ~-0.0001 ~0.5 run summon interaction ~ ~ ~ {Tags:["task_switcher"],width:1.001f,height:1.001f}
execute as @s[tag=active_task] align xyz run particle minecraft:cloud ~0.5 ~ ~0.5 1 1 1 0 5 force @a
```

#### 4. スコアボードの追加（.install.mcfunction）
```mcfunction
scoreboard objectives add mined.diamond_ore mined:diamond_ore
```

#### 5. reward/.common.mcfunctionに追加
```mcfunction
execute as @a[scores={mined.diamond_ore=1..}] run function werewolf:task/field/village/reward/diamond_ore
scoreboard players set @a mined.diamond_ore 0
```

#### 6. reward/diamond_ore.mcfunctionを作成
```mcfunction
##報酬
give @s diamond 1
```

#### 7. .mcfunctionに追加（消化済み削除）
```mcfunction
execute as @e[type=marker,tag=active_task,tag=diamond_ore] at @s align xyz unless block ~ ~ ~ minecraft:diamond_ore positioned ~0.5 ~500.5 ~0.5 run kill @e[type=item_display,tag=select_block,distance=..0.5]
```

#### 8. reset.mcfunctionに追加
```mcfunction
execute as @e[type=marker,tag=village,tag=task_point,tag=diamond_ore] at @s run setblock ~ ~ ~ deepslate
```

#### 9. item_modifier/set_components/can_break/にファイル追加
**set_diamond_ore.json**:
```json
{
  "function": "minecraft:set_components",
  "components": {
    "minecraft:can_break": {
      "predicates": [
        {
          "blocks": "minecraft:diamond_ore"
        }
      ]
    }
  }
}
```

#### 10. task/switcher/on_player.mcfunctionに追加
```mcfunction
execute if data entity @s SelectedItem{id:"minecraft:iron_pickaxe"} run item modify entity @s weapon.mainhand werewolf:set_components/can_break/set_diamond_ore
```

#### 11. .mcfunctionのcan_break削除に追加
```mcfunction
execute as @a[scores={can_mining_task=0}] if data entity @s SelectedItem.components."minecraft:can_break".predicates[{blocks:"minecraft:diamond_ore"}] run item modify entity @s weapon.mainhand werewolf:set_components/can_break/remove
```

---

## まとめ

Villageマップは人狼クエストの標準的なマップ実装です。

### 重要なポイント
1. **タスクポイントシステム**: markerエンティティで位置を管理
2. **ランダム選択**: sort=randomとlimitでアクティブタスクを選択
3. **3種類のタスクタイプ**: 採掘、1クリック、インタラクション
4. **可視化**: select_block（item_display）でプレイヤーに位置を示す
5. **報酬システム**: 確率判定とスコアボード/NBTデータで実装

このリファレンスを参考に、新しいマップやタスクを追加できます。

