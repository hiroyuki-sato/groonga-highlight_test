
## やりたいこと

* 特定のキーワードにヒットする場合、highlight_htmlでハイライト
* 特定のキーワードにヒットしないある範囲のデータも合わせて取得

## 問題点

highlight_htmlを使うと遅い

## ファイル構成

```
hsato-mbp:groonga-highlight_test hsato$ tree
.
|-- Makefile             # Makefile
|-- README.md            # 本文書
|-- analize              # クエリログ
|   |-- highlight.log    # 遅いログ
|   `-- no_highlight.log # 速いログ
|-- data                 # データファイルディレクトリ
|   `-- data.txt         # データファイル
|-- database             # データベースディレクトリ
|-- groonga.txt          # 遅いクエリ(highlight_htmlあり)
|-- groonga2.txt         # 速いクエリ(highlight_htmlなし)
|-- load.rb              # データロードスクリプト
|-- log                  # ログディレクトリ
`-- schema.txt           # スキーマファイル
```

## 使い方

### データベースの設定

```
make
```

### 遅いクエリの実行

```
make slow
```

* groonga.txtを実行します。

### 速いクエリの実行

```
make normal
```

* groonga2.txtを実行します。

### データ削除

```
make clean
```

## 実行時間

### 遅いクエリ

real	0m50.543s
user	0m47.406s
sys	0m2.926s

### 速いクエリ

real	0m0.293s
user	0m0.112s
sys	0m0.037s


## クエリ

```
select \
  --table Data \
  --match_columns article \
  --output_columns "_key,highlight_html(article),line_no" \
  --query "( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<500)" \
  --command_version 2 \
  --limit -1
```

違いはhighlight_htmlがあるかないか


## クエリ解析結果

## 遅いクエリ


```
groonga-query-log-analyze analize/highlight.log
Summary:
  Threshold:
    slow response     : 0.2
    slow operation    : 0.1
  # of responses      : 1
  # of slow responses : 1
  responses/sec       : 0.01982501529549493
  start time          : 2015-08-27 11:55:47.4
  last time           : 2015-08-27 11:56:37.4
  period(sec)         : 50.441323
  slow response ratio : 100.000%
  total response time : 50.441323
  Slow Operations:
    [50.306572](99.73%) [1](100.00%)    output: _key,highlight_html(article),line_no

Slow Queries:
1) [2015-08-27 11:55:47.4-2015-08-27 11:56:37.4 (50.44132300)](0): select --table Data        --match_columns article        --output_columns "_key,highlight_html(article),line_no"        --query "( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<500)"        --command_version 2        --limit -1  name: <select>
  parameters:
    <table>: <Data>
    <match_columns>: <article>
    <output_columns>: <_key,highlight_html(article),line_no>
    <query>: <( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<500)>
    <command_version>: <2>
    <limit>: <-1>
  1) 0.02277700:     filter( 42570) query: ( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<500)
  2) 0.01950600:     filter( 10880)
  3) 0.00744500:     filter( 10880)
  4) 0.00643600:     filter( 10905)
  5) 0.00373600:     filter( 11040)
  6) 0.00475500:     filter( 11050)
  7) 0.00470000:     filter( 11055)
  8) 0.00013100:     filter( 11070)
  9) 0.00013700:     filter( 11070)
 10) 0.00504900:     filter( 11075)
 11) 0.00013100:     filter( 11080)
 12) 0.00474600:     filter( 11085)
 13) 0.00011000:     filter( 11090)
 14) 0.00511800:     filter( 11095)
 15) 0.00013400:     filter( 11105)
 16) 0.00134400:     filter( 11110)
 17) 0.00372000:     filter( 11110)
 18) 0.00341100:     filter( 11115)
 19) 0.00008300:     filter( 11120)
 20) 0.00004600:     filter( 11120)
 21) 0.00275300:     filter( 11175)
 22) 0.00008800:     filter( 11215)
 23) 0.00006600:     filter( 11225)
 24) 0.00006400:     filter( 11230)
 25) 0.00009600:     filter( 11240)
 26) 0.00220300:     filter( 11240)
 27) 0.00255300:     filter( 11245)
 28) 0.00012700:     filter( 11255)
 29) 0.00003900:     filter( 11260)
 30) 0.00004300:     filter( 11265)
 31) 0.00137400:     filter( 11270)
 32) 0.00080400:     filter( 11280)
 33) 0.00012200:     filter( 11290)
 34) 0.00680400:     filter( 11290)
 35) 0.00007900:     filter( 11290)
 36) 0.01096600:     filter( 11290)
 37) 0.00207300:     filter( 11415)
 38) 0.00005100:     filter( 11425)
 39) 0.00004000:     filter( 11430)
 40) 0.00420100:     filter( 11455)
 41) 0.00076600:     filter( 11460)
 42) 0.00008000:     filter( 11475)
 43) 0.00004300:     filter( 11485)
 44) 0.00002600:     filter( 11490)
 45) 0.00266900:     filter( 11495)
 46) 0.00201500:     filter( 11500)
 47) 0.00010000:     filter( 11505)
 48) 0.00005700:     filter( 11505)
 49) 0.00002000:     select( 11505)
 50) 50.30657200:     output( 11505) _key,highlight_html(article),line_no
```

## 速いクエリ


```
Summary:
  Threshold:
    slow response     : 0.2
    slow operation    : 0.1
  # of responses      : 1
  # of slow responses : 0
  responses/sec       : 5.240897870623196
  start time          : 2015-08-27 11:59:17.4
  last time           : 2015-08-27 11:59:17.4
  period(sec)         : 0.19080699999999998
  slow response ratio : 0.000%
  total response time : 0.19080699999999998
  Slow Operations:

Slow Queries:
1) [2015-08-27 11:59:17.4-2015-08-27 11:59:17.4 (0.19080700)](0): select --table Data        --match_columns article        --output_columns "_key,article,line_no"        --query "( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<500)"        --command_version 2        --limit -1  name: <select>
  parameters:
    <table>: <Data>
    <match_columns>: <article>
    <output_columns>: <_key,article,line_no>
    <query>: <( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<500)>
    <command_version>: <2>
    <limit>: <-1>
  1) 0.02615700:     filter( 42570) query: ( あいこ OR あかり OR ありま OR いつお OR うらら OR かおり OR かとう OR かなえ OR かなめ OR きよこ OR きよみ OR こずえ OR しげこ OR すずき  OR せいこ OR せんだ OR たいじ OR たけお OR たまえ OR ちゃん OR ちょこ OR とよこ OR ながの OR のぼる OR のむら OR まこと OR みどり OR みやこ OR みゆき OR よしの OR よしみ OR 健次郎 OR 利根川 OR 千々石 OR 千鶴子 OR 大久保 OR 大河原 OR 威海衛 OR 宇都宮 OR 小石川 OR 江田島 OR 海江田 OR 西久保 OR 高千穂 OR こうへい OR こうめい ) OR (line_no:>1 + line_no:<500)
  2) 0.01836100:     filter( 10880)
  3) 0.00595800:     filter( 10880)
  4) 0.00412700:     filter( 10905)
  5) 0.00286800:     filter( 11040)
  6) 0.00415600:     filter( 11050)
  7) 0.00368400:     filter( 11055)
  8) 0.00012600:     filter( 11070)
  9) 0.00013800:     filter( 11070)
 10) 0.00392200:     filter( 11075)
 11) 0.00013200:     filter( 11080)
 12) 0.00409800:     filter( 11085)
 13) 0.00010900:     filter( 11090)
 14) 0.00353900:     filter( 11095)
 15) 0.00010300:     filter( 11105)
 16) 0.00106300:     filter( 11110)
 17) 0.00324400:     filter( 11110)
 18) 0.00301100:     filter( 11115)
 19) 0.00008100:     filter( 11120)
 20) 0.00004600:     filter( 11120)
 21) 0.00249900:     filter( 11175)
 22) 0.00008900:     filter( 11215)
 23) 0.00006600:     filter( 11225)
 24) 0.00006600:     filter( 11230)
 25) 0.00009700:     filter( 11240)
 26) 0.00265000:     filter( 11240)
 27) 0.00212200:     filter( 11245)
 28) 0.00012700:     filter( 11255)
 29) 0.00003900:     filter( 11260)
 30) 0.00004400:     filter( 11265)
 31) 0.00100100:     filter( 11270)
 32) 0.00050800:     filter( 11280)
 33) 0.00012300:     filter( 11290)
 34) 0.00597000:     filter( 11290)
 35) 0.00010400:     filter( 11290)
 36) 0.00794500:     filter( 11290)
 37) 0.00188200:     filter( 11415)
 38) 0.00005300:     filter( 11425)
 39) 0.00004000:     filter( 11430)
 40) 0.00308300:     filter( 11455)
 41) 0.00077000:     filter( 11460)
 42) 0.00005300:     filter( 11475)
 43) 0.00005300:     filter( 11485)
 44) 0.00002600:     filter( 11490)
 45) 0.00170900:     filter( 11495)
 46) 0.00203300:     filter( 11500)
 47) 0.00009700:     filter( 11505)
 48) 0.00005800:     filter( 11505)
 49) 0.00002100:     select( 11505)
 50) 0.07185400:     output( 11505) _key,article,line_no

```
