# マイクラ人狼クエスト - システム概要

## バージョン
Ver 3.0.0

## 目次
1. [データパック基本情報](#データパック基本情報)
2. [ゲームフローとフェーズシステム](#ゲームフローとフェーズシステム)
3. [マップシステム](#マップシステム)
4. [役職システム](#役職システム)
5. [クエストシステム](#クエストシステム)
6. [タスクシステム](#タスクシステム)
7. [アイテムシステム](#アイテムシステム)
8. [ストレージとスコアボード](#ストレージとスコアボード)

---

## データパック基本情報

### 名前空間
- **werewolf**: メインの名前空間
- **minecraft**: バニラの機能をオーバーライド（loot_tables, tags等）

### pack.mcmeta
```json
{
  "pack": {
    "pack_format": 41,
    "description": "wwq_datapack"
  },
  "filter": {
    "block": [
      {"namespace":"minecraft", "path":"recipes/.*"},
      {"namespace":"minecraft", "path":"advancements/.*"}
    ]
  }
}
```
- Minecraft 1.21.x対応（pack_format: 41）
- バニラのレシピとアドバンスメントをブロック

### エントリーポイント
- **ロード時**: `werewolf:.install` (minecraft:load)
- **毎tick**: `werewolf:.loop` (minecraft:tick)

---

## ゲームフローとフェーズシステム

### フェーズの種類
ゲームは以下の4つのフェーズで管理されます：

1. **stanby** (待機フェーズ)
   - プレイヤーがゲームに参加する前の状態
   - 処理: `werewolf:system/phase/stanby/`

2. **switch_playing** (ゲーム開始への切り替え)
   - stanbyからplayingへの移行処理
   - 処理: `werewolf:system/phase/switch_playing/`

3. **playing** (ゲーム中)
   - メインのゲームプレイ状態
   - 処理: `werewolf:system/phase/playing/`
   - 昼夜サイクル、タスク、クエスト、役職スキルなどが実行される

4. **switch_stanby** (待機への切り替え)
   - playingからstandbyへの移行処理
   - 処理: `werewolf:system/phase/switch_stanby/`

### フェーズの保存場所
```
data storage werewolf: {phase: "stanby"|"switch_playing"|"playing"|"switch_stanby"}
```

### 時間管理
ゲーム中は昼と夜が切り替わります：

#### 時間の種類
- **first_day**: 最初の昼（デフォルト: 1200tick / 60秒）
- **day**: 通常の昼（デフォルト: 3600tick / 180秒）
- **night**: 夜（デフォルト: 1200tick / 60秒）
- **trial**: 緊急裁判（デフォルト: 2400tick / 120秒）

#### ストレージ構造
```
data storage werewolf: settings.time {
  first_day: {tick: 1200, second: 60},
  day: {tick: 3600, second: 180},
  night: {tick: 1200, second: 60}
}
```

---

## マップシステム

### 実装済みマップ
現在2つのマップが実装されています：

1. **village** (村)
2. **cave** (洞窟)

### マップの選択
```
data storage werewolf: settings.field = "village" | "cave"
```

### マップの構造
各マップは以下のディレクトリ構造を持ちます：

```
data/werewolf/functions/task/field/[マップ名]/
├── reset.mcfunction           # マップのリセット処理
├── .mcfunction                # マップごとのタスク処理
├── set/                       # タスク設置処理
│   ├── .day.mcfunction       # 昼タスクの設置
│   ├── .night.mcfunction     # 夜タスクの設置
│   └── [タスク名].mcfunction # 各タスクの個別設置処理
└── reward/                    # タスク報酬処理
    ├── .common.mcfunction    # 共通報酬処理
    ├── .1click.mcfunction    # 1クリックタスクの報酬処理
    └── [タスク名].mcfunction # 各タスクの報酬処理
```

### タスクポイントシステム
マップ内には`marker`エンティティがタスクポイントとして配置されています。

#### タグ構造
- **マップ識別タグ**: `village` または `cave`
- **タイプタグ**: `task_point`
- **タスク種類タグ**: `oak_log`, `iron_ore`, `wheat`, `red_mushroom`, `brown_mushroom`, `treasure_chest`, `night_task`, `mob` など
- **アクティブタグ**: `active_task` (ランダムに選ばれたタスクに付与)

例：
```mcfunction
# 村マップの木材タスクポイントで、アクティブなもの
@e[type=marker,tag=village,tag=task_point,tag=oak_log,tag=active_task]
```

---

## 役職システム

### 役職の分類
役職は4つの陣営に分かれています：

#### 1. 人狼陣営
- **jinrou** (人狼)
- **assassin** (暗殺者)
- **shuffler** (シャッフラー)

#### 2. 狂人陣営
- **kyoujin** (狂人)
- **kyoushin** (狂信者)
- **wanashi** (話者)

#### 3. 村人陣営
- **mura** (村人)
- **uranai** (占い師)
- **reinou** (霊能者)
- **kishi** (騎士)
- **soujiya** (掃除屋)
- **kyouyuu** (狂猶)
- **panya** (パン屋)
- **ponkotsu** (ポンコツ)
- **ojousama** (お嬢様)
- **saibankan** (裁判官)
- **kaitou** (怪盗)
- **meros** (メロス)
- **shaman** (シャーマン)
- **mahou_shoujo** (魔法少女)

#### 4. 第三陣営
- **youko** (妖狐)
- **haitoku** (背徳者)
- **shinigami** (死神)
- **cupid** (キューピッド)
- **teruteru** (てるてる)

### 役職の構造
各役職は以下のディレクトリ構造を持ちます：

```
data/werewolf/functions/role/[役職名]/
├── playing/                  # ゲーム中の処理
│   ├── first_day.mcfunction # 初日の処理
│   ├── second_day_onwards.mcfunction # 2日目以降の処理
│   └── set_skill.mcfunction # スキル設定
├── setup/                    # セットアップ処理
│   ├── join.mcfunction      # 参加時の処理
│   ├── start.mcfunction     # 開始時の処理
│   └── reset_0.mcfunction   # リセット処理
├── skill/                    # スキル処理
├── settings/                 # 設定UI
├── role_book/               # 役職本
├── result.mcfunction        # 結果処理
└── reward.mcfunction        # 報酬処理
```

### 役職リスト管理
```
data storage werewolf: role_list
# .install で初期化され、全役職が登録される
```

---

## クエストシステム

### 実装済みクエスト（16種類）
1. **random_teleport** - ランダムテレポート
2. **acid_rain** - 酸性雨
3. **hit_the_target** - 的当て
4. **stray_wolf** - 迷い狼
5. **falling_salmon** - 落下鮭
6. **poison_axolotl** - 毒ウーパールーパー
7. **ancient_hidden_room** - 古代の隠し部屋
8. **delivery_bread** - パン配達
9. **delivery_apple** - リンゴ配達
10. **cave_in** - 落盤
11. **maido_ookini** - 毎度おおきに
12. **lost_bread** - 失われたパン
13. **where_is_my_wolf** - 私の狼はどこ？
14. **security_up** - セキュリティアップ
15. **inventory_exchange** - インベントリ交換
16. **crystal_collecting** - クリスタル収集
17. **add_job_change_item_villager** - 村人職業変更アイテム追加

### クエスト構造
各クエストは以下のディレクトリ構造を持ちます：

```
data/werewolf/functions/quest/[クエスト名]/
├── 0.mcfunction (または start.mcfunction)  # クエスト開始
├── summon.mcfunction                       # エンティティ召喚
├── clear.mcfunction                        # クリア処理
├── failed.mcfunction                       # 失敗処理
├── penalty.mcfunction                      # ペナルティ処理
└── reset.mcfunction                        # リセット処理
```

### クエスト管理
```
data storage werewolf: quest_list
data storage werewolf: settings.gamemode.quest = true|false
data storage werewolf: settings.quest.interval = 1000 (デフォルト)
scoreboard objectives add quest_timer dummy
```

### クエスト発生条件
- 昼の間のみ発生
- タイマーが0になると発生
- 処理: `werewolf:.util/quest_processing/start/`

---

## タスクシステム

### タスクの種類

#### villageマップのタスク
**昼タスク:**
- **oak_log** (オークの原木) - 採掘タスク、15個ランダム配置
- **iron_ore** (鉄鉱石) - 採掘タスク、15個ランダム配置
- **wheat** (小麦) - 1クリックタスク、15個ランダム配置
- **red_mushroom** (赤キノコ) - 1クリックタスク、15個ランダム配置
- **brown_mushroom** (茶キノコ) - 1クリックタスク、15個ランダム配置
- **treasure_chest** (宝箱) - インタラクションタスク、5個ランダム配置

**夜タスク:**
- **night_task** (cornflower/ヤグルマギク) - 1クリックタスク、10個ランダム配置

#### caveマップのタスク
**昼タスク:**
- **mob** (スライム) - モブ討伐タスク、45体ランダム配置
- **treasure_chest** (宝箱) - インタラクションタスク、5個ランダム配置

**夜タスク:**
- **night_task** (cornflower/ヤグルマギク) - 1クリックタスク、10個ランダム配置

### タスクタイプ

#### 1. 採掘タスク（Switcherタスク）
- プレイヤーがタスクを攻撃してスイッチをON
- 一定時間（25tick）ブロックを破壊可能になる
- 破壊すると報酬を獲得
- 例: oak_log, iron_ore

#### 2. 1クリックタスク
- `interaction`エンティティを攻撃/インタラクトするだけで完了
- 例: wheat, red_mushroom, brown_mushroom, cornflower

#### 3. インタラクションタスク
- `interaction`エンティティとインタラクトして完了
- 例: treasure_chest

#### 4. モブ討伐タスク
- モブを倒すと報酬を獲得
- DeathLootTableで報酬設定
- 例: cave/mob (スライム)

### タスクの可視化
- **select_block**: タスクの位置を示すitem_display（Y+500に配置され、transformationで実際の位置に表示）
- **dummy_task**: 抽選漏れしたタスクの位置を示すblock_display/item_display
- **particle**: タスク設置時にcloudパーティクルを表示

### タスク報酬
- 主にエメラルドを獲得
- ランダム確率で報酬が変動する場合もある

---

## アイテムシステム

### 実装済みアイテム

#### 武器系
- **normal_sword** (通常の剣)
- **strong_sword** (強い剣)
- **normal_bow** (通常の弓)
- **normal_arrow** (通常の矢)
- **axe** (斧)
- **pickaxe** (ピッケル)

#### 魔法の杖（Wand）
- **fire_wand** (炎の杖)
- **ice_wand** (氷の杖)
- **thunder_wand** (雷の杖)
- **heal_wand** (回復の杖)

#### 道具系
- **blindness_tool** (盲目ツール)
- **glowing_tool** (発光ツール)
- **same_look_tool** (同じ見た目ツール)
- **job_change_villager** (村人職業変更)

#### 爆弾系
- **smoke_bomb** (煙幕弾)
- **tnt_bomb** (TNT爆弾)

#### ポーション
- **invisibility_potion** (透明化ポーション)
- **swiftness_potion** (俊敏ポーション)
- **poison_splash_potion** (毒のスプラッシュポーション)
- **slowness_splash_potion** (鈍化のスプラッシュポーション)
- **regeneration_splash_potion** (再生のスプラッシュポーション)

#### 防具
- **same_look_armor** (同じ見た目の防具) - 4部位
- **hat** (帽子) - 9種類

#### 食料
- **bread** (パン)
- **potato** (ジャガイモ)

#### クエストアイテム
- アイテムはクエストごとに定義

### アイテム処理
- メイン処理: `werewolf:item/.mcfunction`
- 右クリック検知: `right_click` スコアボード
- カスタムデータでアイテムを識別: `minecraft:custom_data~{Tags:[...]}`

---

## ストレージとスコアボード

### ストレージ

#### werewolf: （メインストレージ）
```
{
  version: "Ver 3.0.0",
  phase: "stanby"|"switch_playing"|"playing"|"switch_stanby",
  settings: {
    field: "village"|"cave",
    time: {
      first_day: {tick: 1200, second: 60},
      day: {tick: 3600, second: 180},
      night: {tick: 1200, second: 60},
      trial: {tick: 2400, second: 120}
    },
    gamemode: {
      quest: true|false,
      role_count_limit: 0,
      death_place_fixed: false
    },
    trial: {
      must_hang: false,
      delete_grave: true
    },
    quest: {
      interval: 1000
    },
    anim: {
      windmill: false,
      crystal: false
    },
    debug: false
  },
  gamestate: {
    time: {id: "day"|"night"|"trial"},
    quest: {active: true|false}
  },
  role_list: [...],
  quest_list: [...]
}
```

#### macro: util（ユーティリティストレージ）
```
{
  util: {
    role_processing: {
      count: 0,
      number: 0,
      result: "null",
      camp: "null",
      third_camp: 0
    },
    inventory_ui: {
      func: {
        slot_9: "werewolf:system/inventory_ui/slot_9/",
        slot_10: "werewolf:system/inventory_ui/slot_10/",
        slot_11: "werewolf:system/inventory_ui/slot_11/"
      }
    }
  }
}
```

### 主要スコアボード

#### システム系
- **common_timer** - 共通タイマー
- **ID** - プレイヤー個別ID
- **login** - ログイン検知
- **death** - 死亡検知

#### 位置記録
- **death_x**, **death_y**, **death_z** - 死亡位置
- **death_rorate_0**, **death_rorate_1** - 死亡時の向き

#### クエスト系
- **quest_timer** - クエスト発生タイマー
- **quest_bar_timer** - クエストバータイマー
- **quest_bar_update** - クエストバー更新

#### スキル系
- **skill_mode** - スキルモード
- **skill_cooltime_0～3** - スキルクールタイム（0,1は日数回復、2,3は時間回復）
- **skill_limit_0～3** - スキル使用回数制限

#### タスク系
- **can_mining_task** - 採掘タスクの破壊可能時間
- **mined.oak_log** - オークの原木採掘検知
- **mined.iron_ore** - 鉄鉱石採掘検知
- **mined.wheat** - 小麦採掘検知
- **mined.red_mushroom** - 赤キノコ採掘検知
- **mined.brown_mushroom** - 茶キノコ採掘検知

#### アイテム系
- **swords_cooltime** - 剣のクールタイム
- **charge_magic_bullet** - 魔法弾チャージ

#### 裁判系
- **can_vote** - 投票可能フラグ
- **votes** - 投票数
- **trial_button** - 緊急招集ボタン

#### UI系
- **ui_ready** - UI準備完了
- **phase_switcher** - フェーズ切り替え
- **role_list** - 役職リスト表示

#### bossbar系
- **bossbar_negative** - bossbar用負の値

#### 入力検知
- **right_click** - 右クリック検知（carrot_on_a_stick）
- **right_click_1** - 右クリック検知（warped_fungus_on_a_stick）
- **is_sneaking** - スニーク検知

#### 汎用
- **reserve_0～5** - 予約用スコアボード（一時計算用）

---

## ギミックシステム

### 実装済みギミック

#### surviver_check_stone_slab
- 生存者チェック用の石ハーフブロック
- 処理: `werewolf:gimmic/surviver_check_stone_slab/`

#### warp_flame
- ワープ用の炎ギミック
- 処理: `werewolf:gimmic/warp_flame/`

---

## その他の機能

### チーム
- **_entrant** - 参加者用チーム
- **_spectator** - 観戦者用チーム（nametagVisibility: never）
- **glowing_red** - 赤色発光用チーム

### ショップ
- 処理: `werewolf:shop/set_products.mcfunction`
- 価格設定は`.install`時に更新

### 死亡処理
- 死亡位置の記録と固定
- 墓の生成
- 死亡後のテレポート処理
- 処理: `werewolf:system/death/`

### 裁判システム
- 緊急裁判の実施
- 投票システム
- 処理: `werewolf:system/trial/`

### bossbar管理
- 時間表示
- 各種情報表示
- 処理: `werewolf:system/bossbar/`

---

このドキュメントはマイクラ人狼クエストのシステム全体の概要を示しています。
各システムの詳細については、個別のドキュメントを参照してください。

