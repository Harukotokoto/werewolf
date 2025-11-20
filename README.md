# マイクラ人狼クエスト データパック ドキュメント

## バージョン
**Ver 3.0.0**

---

## 📚 ドキュメント一覧

このデータパックの完全なドキュメントセットです。目的に応じて適切なドキュメントを参照してください。

### 1. [SYSTEM_OVERVIEW.md](SYSTEM_OVERVIEW.md)
**システム全体の概要**

データパックの全体像を理解するための最初のドキュメントです。

**内容**:
- データパックの基本情報
- ゲームフローとフェーズシステム
- マップシステムの概要
- 役職システムの概要（25役職）
- クエストシステムの概要（16クエスト）
- タスクシステムの概要
- アイテムシステムの概要
- ストレージとスコアボードの構造

**こんな人におすすめ**:
- 初めてこのデータパックを見る人
- システム全体の構造を把握したい人
- 各システムがどのように連携しているか知りたい人

---

### 2. [DATAPACK_STRUCTURE.md](DATAPACK_STRUCTURE.md)
**全ファイルの詳細構造**

データパック内の全ファイル（1060ファイル）の役割と処理内容を記述しています。

**内容**:
- ディレクトリ構造の完全な説明
- functions（870ファイル）の詳細
  - 役職（25役職 × 約20-40ファイル）
  - クエスト（16クエスト × 約4-10ファイル）
  - タスク（2マップ）
  - システム処理
  - アイテム処理
- advancements（進捗によるイベント検知）
- loot_tables（アイテム定義）
- predicates（条件判定）
- tags（タグ定義）
- その他のデータ

**こんな人におすすめ**:
- 特定のファイルの役割を知りたい人
- ファイル間の関係性を理解したい人
- コードを読んで理解したい人

---

### 3. [MAP_SYSTEM_GUIDE.md](MAP_SYSTEM_GUIDE.md)
**マップシステムの詳細と追加方法**

新しいマップを追加するための完全ガイドです。

**内容**:
- マップシステムの詳細説明
- マップの構造とファイル配置
- タスクポイントの設置方法
- **新規マップの追加手順（ステップバイステップ）**
- タスクの種類と実装方法
  - 採掘タスク（Switcher）
  - 1クリックタスク
  - インタラクションタスク
  - モブ討伐タスク
- マップのカスタマイズ方法
- トラブルシューティング

**こんな人におすすめ**:
- 新しいマップを追加したい人
- 既存のマップを改変したい人
- タスクシステムの実装を理解したい人
- **villageマップに改変を行いたい人（このドキュメントを読んでください！）**

---

### 4. [VILLAGE_MAP_REFERENCE.md](VILLAGE_MAP_REFERENCE.md)
**Villageマップの完全な実装リファレンス**

既存のvillageマップの実装を詳細に解説したリファレンスドキュメントです。

**内容**:
- Villageマップの概要と特徴
- 全タスクの詳細（7種類）
  - oak_log（オークの原木）- 採掘
  - iron_ore（鉄鉱石）- 採掘
  - wheat（小麦）- 1クリック
  - red_mushroom（赤キノコ）- 1クリック
  - brown_mushroom（茶キノコ）- 1クリック
  - treasure_chest（宝箱）- インタラクション
  - cornflower（ヤグルマギク）- 夜タスク
- 全ファイルの完全なコード解説
- タスクフローの詳細図解
- カスタマイズ例
  - タスク数の変更
  - 報酬の変更
  - 確率の変更
  - 新しいタスクの追加

**こんな人におすすめ**:
- Villageマップを改変したい人
- 既存の実装を参考にしたい人
- タスクの実装を深く理解したい人
- **新しいマップを追加する前に、既存の実装を学びたい人**

---

## 🎯 目的別ガイド

### Villageマップに改変を行いたい
1. **[SYSTEM_OVERVIEW.md](SYSTEM_OVERVIEW.md)** を読んで全体像を把握
2. **[VILLAGE_MAP_REFERENCE.md](VILLAGE_MAP_REFERENCE.md)** で既存の実装を詳しく学ぶ
3. カスタマイズ例を参考に改変を実施

### 新しいマップを追加したい
1. **[SYSTEM_OVERVIEW.md](SYSTEM_OVERVIEW.md)** を読んで全体像を把握
2. **[VILLAGE_MAP_REFERENCE.md](VILLAGE_MAP_REFERENCE.md)** で既存の実装を参考にする
3. **[MAP_SYSTEM_GUIDE.md](MAP_SYSTEM_GUIDE.md)** のステップバイステップガイドに従う
4. 必要に応じて **[DATAPACK_STRUCTURE.md](DATAPACK_STRUCTURE.md)** で詳細を確認

### 特定のファイルの役割を知りたい
1. **[DATAPACK_STRUCTURE.md](DATAPACK_STRUCTURE.md)** でファイルを検索

### システム全体を理解したい
1. **[SYSTEM_OVERVIEW.md](SYSTEM_OVERVIEW.md)** を読む
2. **[DATAPACK_STRUCTURE.md](DATAPACK_STRUCTURE.md)** で詳細を確認

---

## 📊 データパック統計

### ファイル数
- **総ファイル数**: 1060
- **mcfunction**: 870
- **json**: 190

### 主要コンポーネント
- **役職**: 25種類（人狼3、狂人3、村人14、第三5）
- **クエスト**: 16種類
- **マップ**: 2種類（village, cave）
- **タスク種類**: villageマップ7種類、caveマップ3種類
- **アイテム**: 30種類以上

---

## 🔧 技術情報

### 対応バージョン
- **pack_format**: 41
- **Minecraft**: 1.21.x

### 名前空間
- **werewolf**: メイン名前空間
- **minecraft**: バニラ機能のオーバーライド

### エントリーポイント
- **ロード**: `werewolf:.install`
- **tick**: `werewolf:.loop`

---

## 🗂️ ディレクトリ構造（簡易版）

```
data_temp/
├── pack.mcmeta
└── data/
    ├── minecraft/
    │   ├── loot_tables/blocks/      # バニラブロックのルートテーブル
    │   └── tags/functions/          # load/tick
    └── werewolf/
        ├── functions/               # メイン処理（870ファイル）
        │   ├── .install.mcfunction # 初期化
        │   ├── .loop.mcfunction    # メインループ
        │   ├── asset/              # アセット（音、タイトル）
        │   ├── gimmic/             # ギミック
        │   ├── item/               # アイテム処理
        │   ├── quest/              # クエスト（16種類）
        │   ├── role/               # 役職（25種類）
        │   ├── settings/           # 設定
        │   ├── shop/               # ショップ
        │   ├── system/             # システム処理
        │   └── task/               # タスクシステム
        │       └── field/          # マップ別処理
        │           ├── village/    # 村マップ
        │           └── cave/       # 洞窟マップ
        ├── advancements/           # 進捗検知
        ├── loot_tables/            # アイテム定義
        ├── predicates/             # 条件判定
        ├── item_modifiers/         # アイテム変更
        ├── damage_type/            # ダメージタイプ
        └── tags/                   # タグ
```

---

## 🎮 ゲームフロー

```
1. データパックロード
   ├─ .install.mcfunction実行
   ├─ ストレージ初期化
   ├─ スコアボード作成
   └─ 役職/クエストリスト作成
   ↓
2. 待機フェーズ（stanby）
   ├─ プレイヤー参加
   └─ 設定調整
   ↓
3. ゲーム開始（switch_playing）
   ├─ 役職割り当て
   ├─ マップ選択
   └─ タスク設置
   ↓
4. ゲーム中（playing）
   ├─ 昼夜サイクル
   ├─ タスク処理
   ├─ クエスト発生
   ├─ 役職スキル
   ├─ 裁判
   └─ 勝利判定
   ↓
5. ゲーム終了（switch_stanby）
   └─ リザルト表示
```

---

## 🔑 重要なストレージとスコアボード

### ストレージ
```
werewolf:
├─ version: "Ver 3.0.0"
├─ phase: "stanby"|"switch_playing"|"playing"|"switch_stanby"
├─ settings
│  ├─ field: "village"|"cave"
│  ├─ time: {first_day, day, night, trial}
│  ├─ gamemode: {quest, role_count_limit, death_place_fixed}
│  └─ ...
├─ gamestate
│  ├─ time: {id: "day"|"night"|"trial"}
│  └─ quest: {active: true|false}
├─ role_list: [25役職]
└─ quest_list: [16クエスト]
```

### 主要スコアボード
- **common_timer**: 共通タイマー
- **quest_timer**: クエスト発生タイマー
- **skill_cooltime_0~3**: スキルクールタイム
- **can_mining_task**: 採掘タスク破壊可能時間
- **mined.***: ブロック採掘検知
- **right_click**: 右クリック検知
- **death**: 死亡検知

---

## 📝 マップ追加のクイックスタート

新しいマップを追加するための最小限の手順：

### 1. ディレクトリ作成
```
data/werewolf/functions/task/field/[マップ名]/
├── .mcfunction
├── reset.mcfunction
├── set/
│   ├── .day.mcfunction
│   ├── .night.mcfunction
│   └── [タスク名].mcfunction
└── reward/
    ├── .common.mcfunction
    ├── .1click.mcfunction
    └── [タスク名].mcfunction
```

### 2. タスクポイント配置
```mcfunction
summon marker X Y Z {Tags:["[マップ名]","task_point","[タスク種類]"]}
```

### 3. 統合ファイル編集
以下の6つのファイルに新しいマップを追加：
- `task/.mcfunction`
- `task/set_day.mcfunction`
- `task/set_night.mcfunction`
- `task/reset.mcfunction`
- `task/reward/.common.mcfunction`
- `task/reward/.1click.mcfunction`

### 4. テスト
```mcfunction
data modify storage werewolf: settings.field set value "[マップ名]"
function werewolf:task/set_day
```

**詳細は [MAP_SYSTEM_GUIDE.md](MAP_SYSTEM_GUIDE.md) を参照してください。**

---

## ⚠️ 注意事項

### 既知の問題
1. **Cave夜タスクのバグ**: `cave/set/.night.mcfunction`がvillageマップを参照している
   - 影響: 洞窟マップの夜タスクが正常に動作しない可能性
   - 修正方法: ファイルをcave用に書き換える

### 推奨事項
1. **バックアップ**: 改変前に必ずバックアップを取る
2. **テスト**: 改変後は必ずテストする
3. **段階的な変更**: 一度に多くの変更をせず、段階的に行う

---

## 📞 サポート

### ドキュメントの使い方
1. まず [SYSTEM_OVERVIEW.md](SYSTEM_OVERVIEW.md) を読んで全体像を把握
2. 目的に応じて適切なドキュメントを参照
3. 具体的な実装は [VILLAGE_MAP_REFERENCE.md](VILLAGE_MAP_REFERENCE.md) を参考に

### トラブル時の確認項目
1. タグが正しいか確認
2. ストレージの設定を確認
3. スコアボードの値を確認
4. エンティティの存在を確認

---

## 📄 ライセンス

このドキュメントは、マイクラ人狼クエスト Ver 3.0.0 のデータパック構造を解説するために作成されました。

---

## 🎉 まとめ

このドキュメントセットを使用することで：

✅ データパック全体の構造を理解できる  
✅ 既存のvillageマップを改変できる  
✅ 新しいマップを追加できる  
✅ タスクシステムを理解してカスタマイズできる  
✅ 各ファイルの役割と処理内容を把握できる  

**まずは [SYSTEM_OVERVIEW.md](SYSTEM_OVERVIEW.md) から始めましょう！**

