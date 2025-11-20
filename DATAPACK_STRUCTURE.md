# データパック構造詳細

## 目次
1. [ディレクトリ構造概要](#ディレクトリ構造概要)
2. [functions詳細](#functions詳細)
3. [advancements詳細](#advancements詳細)
4. [loot_tables詳細](#loot_tables詳細)
5. [predicates詳細](#predicates詳細)
6. [tags詳細](#tags詳細)
7. [その他のデータ](#その他のデータ)

---

## ディレクトリ構造概要

```
data_temp/
├── pack.mcmeta
└── data/
    ├── minecraft/
    │   ├── loot_tables/        # バニラブロックのルートテーブル上書き
    │   └── tags/               # ロード/tick関数タグ
    └── werewolf/
        ├── functions/          # 870ファイル - メイン処理
        ├── advancements/       # 進捗によるイベント検知
        ├── loot_tables/        # アイテム/報酬定義
        ├── predicates/         # 条件判定
        ├── item_modifiers/     # アイテム変更
        ├── damage_type/        # ダメージタイプ定義
        └── tags/               # エンティティ/ブロック/流体タグ
```

---

## functions詳細

### ルートレベルファイル

#### .install.mcfunction
**役割**: データパックのロード時に1回だけ実行される初期化処理

**主な処理内容**:
1. バージョン情報の設定（Ver 3.0.0）
2. 役職リストの作成（25役職）
3. クエストリストの作成（16クエスト）
4. チーム作成（_entrant, _spectator, glowing_red）
5. フィールドの初期設定（デフォルト: village）
6. 昼夜サイクルの時間設定
7. クエストシステムの初期化
8. スコアボード objectives の作成（40個以上）
9. ストレージの初期化
10. ゲームのリセット

**呼び出し元**: `minecraft:load` タグ

#### .loop.mcfunction
**役割**: 毎tick実行されるメインループ

**主な処理内容**:
1. 右クリック検知の統合（right_click + right_click_1）
2. フェーズごとの処理分岐
   - stanby
   - switch_playing
   - playing
   - switch_stanby
3. ログイン検知と処理
4. 経験値オーブの削除
5. プレイヤーサイズの固定
6. アイテム処理（playingフェーズ以外）
7. 入力リセット（右クリック、スニーク）

**呼び出し元**: `minecraft:tick` タグ

#### summon_dummy.mcfunction
**役割**: ダミーエンティティの召喚

---

### asset/ - アセット関連

#### asset/sfx/ - 効果音
- **click.mcfunction** - クリック音
- **error.mcfunction** - エラー音
- **game_start_third.mcfunction** - ゲーム開始音（第三陣営用）
- **game_start_villager.mcfunction** - ゲーム開始音（村人用）
- **game_start_wolf.mcfunction** - ゲーム開始音（人狼用）
- **open_book.mcfunction** - 本を開く音
- **quest/quest_active.mcfunction** - クエスト発生音

#### asset/title/ - タイトル表示
- **quest/clear.mcfunction** - クエストクリアタイトル
- **quest/failed.mcfunction** - クエスト失敗タイトル
- **quest/start.mcfunction** - クエスト開始タイトル
- **quest/warning.mcfunction** - 警告タイトル

---

### gimmic/ - ギミック

#### gimmic/surviver_check_stone_slab/
生存者チェック用石ハーフブロックギミック

- **0.mcfunction** - 初期処理
- **check.mcfunction** - チェック処理
- **announce.mcfunction** - アナウンス

#### gimmic/warp_flame/
ワープ用炎ギミック

- **warp.mcfunction** - ワープ処理
- **lock.mcfunction** - ロック処理
- **announce.mcfunction** - アナウンス

---

### item/ - アイテム処理

#### .mcfunction
メインのアイテム処理ルーター
- smoke_bomb, tnt_bomb, same_look_tool, blindness_tool, glowing_tool等の処理を呼び出し
- 武器の攻撃力調整
- 弓矢の軌道表示
- 空き瓶の削除

#### item/blindness_tool/
盲目ツール
- **run.mcfunction** - 実行処理
- **defuse.mcfunction** - 解除処理

#### item/glowing_tool/
発光ツール
- **run.mcfunction** - 実行処理

#### item/job_change_villager/
村人職業変更アイテム
- **run.mcfunction** - 実行処理
- **0.mcfunction**, **1.mcfunction** - 段階別処理

#### item/same_look_tool/
同じ見た目ツール
- **run.mcfunction** - 実行処理
- **defuse.mcfunction** - 解除処理

#### item/smoke_bomb/
煙幕弾
- **summon.mcfunction** - 召喚
- **bounce.mcfunction** - バウンス処理
- **explosion.mcfunction** - 爆発処理

#### item/tnt_bomb/
TNT爆弾
- **summon.mcfunction** - 召喚
- **bounce.mcfunction** - バウンス処理
- **explosion.mcfunction** - 爆発処理

#### item/sword/
剣系アイテム
- **normal/** - 通常の剣（2ファイル）
- **strong/** - 強い剣（2ファイル）

#### item/wand/
魔法の杖
- **fire_wand/** - 炎の杖（6ファイル）
- **heal_wand/** - 回復の杖（6ファイル）
- **ice_wand/** - 氷の杖（6ファイル）
- **thunder_wand/** - 雷の杖（6ファイル）

---

### quest/ - クエストシステム

#### playing.mcfunction
クエストのメイン処理
- タイマー減算
- クエスト発生判定

#### 各クエストディレクトリ

##### quest/random_teleport/
ランダムテレポート
- **0.mcfunction** - 開始
- **1.mcfunction** - 処理1
- **2.mcfunction** - 処理2
- **reset.mcfunction** - リセット

##### quest/acid_rain/
酸性雨
- **0.mcfunction** - 開始
- **reset.mcfunction** - リセット

##### quest/hit_the_target/
的当て
- **summon.mcfunction** - ターゲット召喚
- **clear.mcfunction** - クリア
- **failed.mcfunction** - 失敗
- **penalty.mcfunction** - ペナルティ
- **penalty_0.mcfunction**, **penalty_1.mcfunction** - ペナルティ段階
- **schedule.mcfunction** - スケジュール
- **reset.mcfunction** - リセット

##### quest/stray_wolf/
迷い狼（7ファイル）
- summon, clear, failed, penalty等

##### quest/falling_salmon/
落下鮭（4ファイル）
- summon, clear, eat, reset

##### quest/poison_axolotl/
毒ウーパールーパー（6ファイル）

##### quest/ancient_hidden_room/
古代の隠し部屋（7ファイル）
- break, clear, failed, give, open, reset, summon

##### quest/delivery_bread/
パン配達（7ファイル）
- clear, delivery, failed, penalty, reset, schedule, summon

##### quest/delivery_apple/
リンゴ配達（10ファイル）
- clear, delivery, eat, failed, give, penalty, reset, rot_fruit, schedule, summon

##### quest/cave_in/
落盤（4ファイル）
- 0, 1, 2, reset

##### quest/maido_ookini/
毎度おおきに（4ファイル）
- 0, 1, remove_offer, reset

##### quest/lost_bread/
失われたパン（3ファイル）
- 0, 1, reset

##### quest/where_is_my_wolf/
私の狼はどこ？（5ファイル）
- summon, clear, failed, reset

##### quest/security_up/
セキュリティアップ（7ファイル）

##### quest/inventory_exchange/
インベントリ交換（5ファイル）
- 0, 1, 2, 3, reset

##### quest/crystal_collecting/
クリスタル収集（7ファイル）
- clear, delivery, failed, penalty, penalty_1, reset, summon

##### quest/add_job_change_item_villager/
村人職業変更アイテム追加（4ファイル）
- 0, 1, remove_offer, reset

---

### role/ - 役職システム

各役職は同様の構造を持ちます：

```
role/[役職名]/
├── playing/                    # ゲーム中の処理
│   ├── first_day.mcfunction   # 初日
│   ├── second_day_onwards.mcfunction  # 2日目以降
│   ├── set_book.mcfunction    # 本の設定
│   └── set_skill.mcfunction   # スキル設定
├── setup/                      # セットアップ
│   ├── join.mcfunction        # 参加時
│   ├── start.mcfunction       # 開始時
│   ├── reset_0.mcfunction     # リセット
│   ├── reset_1.mcfunction     # リセット2
│   └── save_role.mcfunction   # 役職保存
├── skill/                      # スキル処理
│   └── [スキル名]/
│       ├── main_0.mcfunction
│       ├── main_1.mcfunction
│       └── ...
├── settings/                   # 設定
│   ├── count/                 # 人数設定
│   │   ├── add.mcfunction
│   │   └── remove.mcfunction
│   ├── skill/                 # スキル設定
│   │   └── [スキル名]/
│   │       ├── cooltime/      # クールタイム
│   │       │   ├── add.mcfunction
│   │       │   └── remove.mcfunction
│   │       └── limit/         # 使用回数制限
│   │           ├── add.mcfunction
│   │           └── remove.mcfunction
│   └── ui.mcfunction          # UI
├── role_book/                  # 役職本
│   ├── normal.mcfunction      # 通常
│   ├── dummy.mcfunction       # ダミー
│   └── lost.mcfunction        # 喪失
├── result.mcfunction           # 結果
├── reward.mcfunction           # 報酬
└── victory_judge.mcfunction    # 勝利判定（一部役職のみ）
```

#### 実装済み役職（25個）
1. **assassin** (暗殺者) - 29ファイル
2. **cupid** (キューピッド) - 31ファイル
3. **haitoku** (背徳者) - 16ファイル
4. **jinrou** (人狼) - 42ファイル
5. **kaitou** (怪盗) - 40ファイル
6. **kishi** (騎士) - 26ファイル
7. **kyoujin** (狂人) - 14ファイル
8. **kyoushin** (狂信者) - 17ファイル
9. **kyouyuu** (狂猶) - 17ファイル
10. **mahou_shoujo** (魔法少女) - 41ファイル
11. **meros** (メロス) - 21ファイル
12. **mura** (村人) - 14ファイル
13. **ojousama** (お嬢様) - 22ファイル
14. **panya** (パン屋) - 15ファイル
15. **ponkotsu** (ポンコツ) - 24ファイル
16. **reinou** (霊能者) - 21ファイル
17. **saibankan** (裁判官) - 26ファイル
18. **shaman** (シャーマン) - 22ファイル
19. **shinigami** (死神) - 27ファイル
20. **shuffler** (シャッフラー) - 37ファイル
21. **soujiya** (掃除屋) - 28ファイル
22. **teruteru** (てるてる) - 15ファイル
23. **uranai** (占い師) - 24ファイル
24. **wanashi** (話者) - 30ファイル
25. **youko** (妖狐) - 23ファイル

---

### settings/ - 設定

#### settings/reload_ui/
- **0.mcfunction** - UI再読み込み

---

### shop/ - ショップ

#### shop/set_products.mcfunction
ショップの商品設定

#### shop/settings/
- **0.mcfunction** - 設定0
- **1.mcfunction** - 設定1

---

### system/ - システム処理

#### system/bossbar/
ボスバー管理（5ファイル）

#### system/countdown/
カウントダウン（3ファイル）

#### system/damage/
ダメージ処理（2ファイル）

#### system/death/
死亡処理（14ファイル）
- death_reservation, grave, main, search, tp等

#### system/give/
アイテム付与（1ファイル）

#### system/inventory_ui/
インベントリUI（3ファイル）

#### system/login/
ログイン処理（2ファイル）
- **first_time.mcfunction** - 初回ログイン
- **every_time.mcfunction** - 毎回ログイン

#### system/phase/
フェーズ管理（6ファイル + サブディレクトリ）
- **stanby/** - 待機フェーズ
- **switch_playing/** - ゲーム開始への切り替え
- **playing/** - ゲーム中
  - **field/village/** - 村マップ固有処理
  - **field/cave/** - 洞窟マップ固有処理
- **switch_stanby/** - 待機への切り替え
- **end/** - 終了処理
- **victory_judge.mcfunction** - 勝利判定

#### system/set_player/
プレイヤー設定（2ファイル）

#### system/time_change/
時間変更（5ファイル）

#### system/tp/
テレポート（3ファイル）

#### system/trial/
裁判システム（15ファイル）
- 投票、集計、処理等

---

### task/ - タスクシステム

#### ルートレベル
- **.mcfunction** - タスクのメイン処理ルーター
- **reset.mcfunction** - タスク全体のリセット
- **set_day.mcfunction** - 昼タスク設定のルーター
- **set_night.mcfunction** - 夜タスク設定のルーター

#### task/reward/
共通報酬処理
- **.common.mcfunction** - 共通報酬処理のルーター
- **.1click.mcfunction** - 1クリックタスク報酬のルーター

#### task/switcher/
Switcherタスク処理
- **on_player.mcfunction** - プレイヤー側ON処理
- **on_switcher.mcfunction** - Switcher側ON処理
- **off_switcher.mcfunction** - Switcher側OFF処理
- **kill.mcfunction** - Switcher削除

#### task/field/village/
村マップのタスク

##### ルートレベル
- **.mcfunction** - 村マップタスクのメイン処理
  - 1クリックタスクの処理
  - Switcherタスクの処理
  - 夜タスクのパーティクル表示
- **reset.mcfunction** - 村マップのリセット
  - ブロック設置
  - Block display召喚

##### village/set/
各タスクの設置処理
- **.day.mcfunction** - 昼タスクの一括設置
  - タスク数設定（ランダムで個数を選択）
  - 個別設置処理の呼び出し
- **.night.mcfunction** - 夜タスクの一括設置
- **oak_log.mcfunction** - オークの原木タスク設置
  - 抽選漏れの処理（barrier + item_display）
  - アクティブタスクの設置（block + item_display + interaction）
  - パーティクル表示
- **iron_ore.mcfunction** - 鉄鉱石タスク設置
- **wheat.mcfunction** - 小麦タスク設置
- **red_mushroom.mcfunction** - 赤キノコタスク設置
- **brown_mushroom.mcfunction** - 茶キノコタスク設置
- **treasure_chest.mcfunction** - 宝箱タスク設置
- **cornflower.mcfunction** - ヤグルマギクタスク設置（夜専用）

##### village/reward/
各タスクの報酬処理
- **.common.mcfunction** - 共通報酬処理
  - ブロック破壊検知による報酬付与
- **.1click.mcfunction** - 1クリックタスク報酬
  - interactionによる報酬付与の分岐
- **oak_log.mcfunction** - オークの原木報酬（エメラルド、確率30%）
- **iron_ore.mcfunction** - 鉄鉱石報酬
- **wheat.mcfunction** - 小麦報酬
- **red_mushroom.mcfunction** - 赤キノコ報酬
- **brown_mushroom.mcfunction** - 茶キノコ報酬
- **treasure_chest.mcfunction** - 宝箱報酬
- **cornflower.mcfunction** - ヤグルマギク報酬

#### task/field/cave/
洞窟マップのタスク

##### ルートレベル
- **.mcfunction** - 洞窟マップタスクのメイン処理
  - 1クリックタスクの処理のみ
- **reset.mcfunction** - 洞窟マップのリセット
  - 現在は空（コメントアウトのみ）

##### cave/set/
各タスクの設置処理
- **.day.mcfunction** - 昼タスクの一括設置
  - mob（スライム）を45体ランダム配置
  - treasure_chestを5個ランダム配置
- **.night.mcfunction** - 夜タスクの一括設置
  - **注意**: 現在はvillageマップのファイルを参照している（バグの可能性）
- **mob.mcfunction** - モブ（スライム）タスク設置
  - 体力2のスライム召喚
  - DeathLootTable設定
- **treasure_chest.mcfunction** - 宝箱タスク設置
- **cornflower.mcfunction** - ヤグルマギクタスク設置（夜専用）

##### cave/reward/
各タスクの報酬処理
- **.common.mcfunction** - 共通報酬処理（現在は空）
- **.1click.mcfunction** - 1クリックタスク報酬
- **treasure_chest.mcfunction** - 宝箱報酬
- **cornflower.mcfunction** - ヤグルマギク報酬

---

## advancements詳細

advancementsはイベント検知に使用されます。

### consume_item/
アイテム消費検知

#### item/
通常アイテム消費

#### quest/
クエスト関連アイテム消費
- **eat_quest_salmon.json** - クエスト用鮭を食べた
- **eat_rot_apple.json** - 腐ったリンゴを食べた

### damage/
ダメージ検知
- **skill.json** - スキルダメージ検知

### entity_hurt_player/
エンティティがプレイヤーを攻撃

#### item/
アイテム関連
- **normal_sword.json** - 通常の剣
- **strong_sword.json** - 強い剣

### interacted_with_entity/
エンティティとのインタラクション

#### gimmic/
ギミック関連
- **surviver_check_stone_slab.json** - 生存者チェック

#### quest/
クエスト関連
- **crystal_collecting.json** - クリスタル収集
- **delivery_apple.json** - リンゴ配達
- **delivery_bread.json** - パン配達
- **ice_sword.json** - 氷の剣
- **security_up.json** - セキュリティアップ

#### skill/
スキル関連
- **necromancer/** - ネクロマンサー
- **reinou/** - 霊能者
- **saibankan/** - 裁判官
- **shaman/** - シャーマン

#### task/
タスク関連（1ファイル）

### inventory_seal/
インベントリ封印検知

### inventory_ui/
インベントリUI検知

### item_durability_changed/
アイテム耐久値変更検知

#### quest/
- **ice_sword.json** - 氷の剣

### player_hurt_entity/
プレイヤーがエンティティを攻撃

#### item/
アイテム関連（2ファイル）

#### skill/
スキル関連（1ファイル）

#### task/
タスク関連（1ファイル）

### used_item/
アイテム使用検知

### villager_trade/
村人との取引検知
- **ice_sword.json** - 氷の剣
- **job_change_villager.json** - 職業変更村人

---

## loot_tables詳細

### death_loot_table/
死亡時のドロップ

#### quest/
クエスト用（4ファイル）

#### task/
タスク用
- **emerald.json** - エメラルドドロップ（モブ討伐タスク用）

### get_name.json
名前取得用

### inventory_seal/buttons/
インベントリ封印UI用ボタン（36ファイル）

### inventory_ui/buttons/
インベントリUI用ボタン（5ファイル）

### item/
各種アイテムの定義

#### 武器
- **axe.json** - 斧
- **normal_arrow.json** - 通常の矢
- **normal_bow.json** - 通常の弓
- **normal_sword.json** - 通常の剣
- **strong_sword.json** - 強い剣
- **pickaxe.json** - ピッケル

#### ツール
- **blindness_tool.json** - 盲目ツール
- **glowing_tool.json** - 発光ツール
- **same_look_tool.json** - 同じ見た目ツール
- **job_change_villager.json** - 村人職業変更

#### 爆弾
- **smoke_bomb.json** - 煙幕弾
- **tnt_bomb.json** - TNT爆弾

#### ポーション
- **invisibility_potion.json** - 透明化ポーション
- **swiftness_potion.json** - 俊敏ポーション
- **poison_splash_potion.json** - 毒のスプラッシュポーション
- **slowness_splash_potion.json** - 鈍化のスプラッシュポーション
- **regeneration_splash_potion.json** - 再生のスプラッシュポーション

#### 防具
- **same_look_armor/** - 同じ見た目の防具（4部位）
- **hat/** - 帽子（9種類）

#### 食料
- **bread.json** - パン
- **potato.json** - ジャガイモ

#### 魔法の杖
- **wand/** - 魔法の杖（4種類）

#### クエストアイテム
- **quest/** - クエストアイテム（3ファイル）

### skill/
スキルアイテム

#### 役職別スキルアイテム
- **assassin/** (暗殺者) - 2ファイル
- **cupid/** (キューピッド) - 2ファイル
- **jinrou/** (人狼) - 4ファイル
- **kaitou/** (怪盗) - 2ファイル
- **kishi/** (騎士) - 2ファイル
- **mahou_shoujo/** (魔法少女) - 2ファイル
- **necromancer/** (ネクロマンサー) - 2ファイル
- **ojousama/** (お嬢様) - 2ファイル
- **reinou/** (霊能者) - 2ファイル
- **saibankan/** (裁判官) - 2ファイル
- **shaman/** (シャーマン) - 2ファイル
- **shinigami/** (死神) - 2ファイル
- **shuffler/** (シャッフラー) - 4ファイル
- **soujiya/** (掃除屋) - 2ファイル
- **uranai/** (占い師) - 2ファイル
- **wanashi/** (話者) - 2ファイル
- **youko/** (妖狐) - 2ファイル
- **no_skill.json** - スキルなし

---

## predicates詳細

### entity_properties/
エンティティのプロパティ判定
- **is_riding.json** - 乗っているか

### flag/
フラグ判定
- **is_sneaking.json** - スニーク中か

### have_item/
アイテム所持判定
- **skill/** - スキルアイテム所持

### inventory_seal/
インベントリ封印判定
- **slot/** - スロット判定

### inventory_ui/
インベントリUI判定
- **slot/** - スロット判定

### is_effect/
エフェクト判定
- **hunger.json** - 空腹エフェクト
- **invisibility_255.json** - 透明化レベル255
- **poison.json** - 毒エフェクト

### location_check/
位置判定
- **in_liquid.json** - 液体内
- **y..-11.json** - Y座標-11以下

### look_at/
視線判定

#### gimmic/
ギミック関連（1ファイル）

#### grave.json
墓を見ている

#### player.json
プレイヤーを見ている

#### quest/
クエスト関連（1ファイル）

#### skill/
スキル関連（1ファイル）

---

## tags詳細

### blocks/
ブロックタグ
- **no_collision.json** - 当たり判定なし

### damage_type/
ダメージタイプタグ
- **dummy_skill.json** - ダミースキル
- **skill.json** - スキル

### entity_types/
エンティティタイプタグ
- **no_shield.json** - シールド無効

### fluids/
流体タグ
- **liquid.json** - 液体

---

## その他のデータ

### damage_type/
ダメージタイプ定義
- **dummy_skill.json** - ダミースキル
- **skill.json** - スキル

### item_modifiers/
アイテム変更

#### other/quest/
クエスト用その他（1ファイル）

#### set_components/can_break/
破壊可能ブロック設定
- **set_oak_log.json** - オークの原木
- **set_iron_ore.json** - 鉄鉱石
- **remove.json** - 削除

#### set_custom_data/
カスタムデータ設定
- **smoke_bomb/** - 煙幕弾（1ファイル）
- **sword/** - 剣（4ファイル）
- **tnt_bomb/** - TNT爆弾（1ファイル）

#### set_damage/
ダメージ設定
- **skill_cooltime.json** - スキルクールタイム
- **wand_durability_add.json** - 杖の耐久値追加
- **wand_durability_remove.json** - 杖の耐久値削除

---

## minecraft名前空間

### loot_tables/blocks/
バニラブロックのルートテーブル上書き
- **brown_mushroom.json** - 茶キノコ
- **iron_ore.json** - 鉄鉱石
- **oak_log.json** - オークの原木
- **red_mushroom.json** - 赤キノコ
- **wheat.json** - 小麦

### tags/damage_type/
- **bypasses_cooldown.json** - クールダウン無視ダメージ

### tags/functions/
- **load.json** - ロード時実行関数
  - `werewolf:.install`
- **tick.json** - 毎tick実行関数
  - `werewolf:.loop`

### trim_material/
- **same_look_armor.json** - 同じ見た目の防具用

### trim_pattern/
- **same_look_armor.json** - 同じ見た目の防具用

---

## ファイル統計

- **総ファイル数**: 1060
  - mcfunction: 870
  - json: 190
- **主要カテゴリ**:
  - 役職（role）: 25役職 × 約20-40ファイル = 約600ファイル
  - クエスト（quest）: 16クエスト × 約4-10ファイル = 約100ファイル
  - タスク（task）: 2マップ × 約10ファイル = 約20ファイル
  - システム（system）: 約50ファイル
  - アイテム（item）: 約30ファイル
  - その他: 約260ファイル

---

このドキュメントは全てのファイルの役割と構造を詳細に記述しています。
マップ追加の具体的な手順については、MAP_SYSTEM_GUIDE.mdを参照してください。

