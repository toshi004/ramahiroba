# ラマさんの、おはなしひろば

## サイト概要
人には言えないような悩みや、ささいな嬉しい出来事などを話したいときに<br>
気軽にご利用いただけるサイトです。<br>
対「人」ではなく、対「キャラクター」の新感覚SNSです。<br>
嫌な出来事を癒したり、嬉しい出来事はキャラクターが一緒に喜んでくれるような<br>
投稿者の感情に寄り添った、日々の癒しになるサイトになることが目的です。<br>
他の人の投稿も読むことができ、<br>
お気に入りのユーザーはフォローすることができるようにしています。<br>
ユーザー同士の交流は当サイトの主な目的としていないため、<br>
フォローの機能は個人的な「お気に入り」の範囲にとどめており、<br>
相互フォローなどを気にせずにお楽しみいただけます。<br>
コメント欄を機能として実装してますが、<br>
昨今、SNS上での誹謗中傷が社会問題になっているため、<br>
もし不快なコメントが来てしまった場合はすぐに削除できる機能をつけています。

### サイトテーマ
サイトオリジナルキャラクターがユーザーの話を聞いてくれるサイト。

### テーマを選んだ理由
通常のSNSだと、「他者が読む」ということを意識してしまい、<br>
自由に投稿できないと感じておりました。<br>
また、相互フォローなどを気にしてしまい、<br>
あまり自由に利用できないと感じておりました。<br>
読む人のことは考えず、<br>
日記感覚で自らが話したいと思った内容で投稿できる場を作りたく当テーマを選びました。<br>
ただ投稿するだけでは人との交流が目的になってしまうと思ったので、<br>
投稿の対象を「キャラクター」にすることにより、目的を明確にさせました。<br>
キャラクターが反応してくれることにより、癒し効果も期待してます。<br>
他のユーザーも投稿を読むことができ、コメントやいいねを押すこともできますが、<br>
サイト内のキャラクターの１人という位置づけとし、<br>
交流を目的としない機能のみ実装してます。<br>

### ターゲットユーザ
* 通常のSNSでは必要以上に気を遣ってしまう人
* 他人との交流をあまり求めず、個人的な日記として利用したい人
* ゆるくSNSを利用したい人

### 主な利用シーン
* 誰かに話を聞いてもらいたいとき
* １日の終わりに今日あった出来事や感じたことなどを記録として投稿したいとき

## 設計書
#### wire
* user
https://1drv.ms/b/s!AnOYVFv7NxcJgZFJAetb_rXpsKv4Xw?e=bXFur8
* admin
https://1drv.ms/b/s!AnOYVFv7NxcJgZFKK0GqdofLzqfz_g?e=BQQ210

#### uiflows
* user
https://1drv.ms/b/s!AnOYVFv7NxcJgZFLb5fuzfluxyBw1A?e=Fe0Nt3
* admin
https://1drv.ms/b/s!AnOYVFv7NxcJgZFMTHWNk2BfpzIR7A?e=N6r86E

#### ER図
https://1drv.ms/b/s!AnOYVFv7NxcJgZFNA55TQKr01lTYdA?e=BJ1e0t

#### テーブル定義書
https://docs.google.com/spreadsheets/d/1HwqBNubwIaHUB3wWdTZuzDxfEtBfbVVxQaDQSd_Gv9M/edit?usp=sharing

#### アプリケーション設計書
https://docs.google.com/spreadsheets/d/1Q2Jh45tFIPdzS2ytEIQTB_S3t_t0cez16wnAuM2iAWg/edit?usp=sharing

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/10Q2uDGlXCQqdhAwznNieVSENQaW3tzEZ7EHjvQUHcdg/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9