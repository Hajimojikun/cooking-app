# README

# アプリ名

### Cooking Com

 # 概要

 このアプリでは料理の投稿、閲覧、編集、削除が出来ます。
 料理の作り方や材料、画像を貼り付けて投稿することでこのアプリを利用する方と共有出来ます。
 ランダムボタンを押すことで投稿されている料理の中から一つランダムで表示されます。

 # 本番環境

 https://cooking-app-hajimoji.herokuapp.com/

 ログイン情報(テスト用)  
 * Email : a@a
 * password : qqq111

 # 制作背景（意図）

 このアプリを作った背景は主婦や主夫の方達が普段献立を考えることが大変という悩みを解決したく制作致しました。食事は毎日毎日必要ですがついついワンパターンになりがちになるのでボタンを押しただけで提案してくれアプリがあったらその手間が省けると思い制作致しました。

 # DEMO

 ## トップページ

 [![Image from Gyazo](https://i.gyazo.com/cb65a2cabbdb2780fa1a83de917a7677.jpg)](https://gyazo.com/cb65a2cabbdb2780fa1a83de917a7677)

 - 投稿された料理がトップページに表示され、画像をクリックすればその料理の詳細ページに遷移します。

 ## 料理詳細ページ

 [![Image from Gyazo](https://i.gyazo.com/53cdc789800b101a51226de8019d3165.jpg)](https://gyazo.com/53cdc789800b101a51226de8019d3165)

 - 詳細ページには料理の作り方や材料などが表示されます。
 - 料理を投稿したユーザーであれば『編集』『削除』ボタンが表示され編集と削除が行えます。
 - 『by』のところには投稿者のニックネームがありそこをクリックすればうユーザーの詳細画面に遷移出来ます。
 


 ## ユーザー詳細画面

 [![Image from Gyazo](https://i.gyazo.com/1d255af03cf51f8921e4d0c18b00df89.jpg)](https://gyazo.com/1d255af03cf51f8921e4d0c18b00df89)

 - ここではひとりのユーザーが過去に投稿した料理が一覧出来ます。
 - またここで画像をクリックしても料理詳細ページに遷移することが可能です。

 ## 料理投稿機能

 [![Image from Gyazo](https://i.gyazo.com/38a73111976a7925ec265af494b68750.gif)](https://gyazo.com/38a73111976a7925ec265af494b68750)

 - 投稿する際に『画像』『料理名』『手順』『材料』『料理の種類』を漏れなく入力すれば投稿することが出来ます。
 - 一つでも漏れがある場合は投稿出来ません。
 - ログイン中のユーザーのみがこの機能を使えます。

 ## ランダム機能

 [![Image from Gyazo](https://i.gyazo.com/846ccc5bce080f7c6abb3ee378b1c7e7.gif)](https://gyazo.com/846ccc5bce080f7c6abb3ee378b1c7e7)

 [![Image from Gyazo](https://i.gyazo.com/11985c9a7dd01cd79218746c813a04de.gif)](https://gyazo.com/11985c9a7dd01cd79218746c813a04de)

- ランダム機能はトップページにあるランダムボタンを押すことでページを遷移でき料理の種類を選んでランダムボタンを押すとその料理の種類の中からランダムで一つ料理を表示させることが出来ます。

- ログインしているユーザーのみが使用できる機能です。

# 工夫したポイント

全てではないですが違うページに遷移できるボタンの上にマウスカーソルがくると色が変わるようにして遷移できることを可視化したことです。  
それと、色に関しては色覚異常の為細かい色の識別が出来ないためバックグラウンドイメージを使用することにより全体的のバランスで色を捉えたということです。  
ランダム機能ではただランダムに結果を出すのではなく種類を絞って結果を出すというところは工夫しました。

# 使用技術（開発環境）

### バックエンド
- Ruby, Ruby on Rails
### フロントエンド
- JavaScript
### データベース
- MySQL, SequelPro
### インフラ
- Heroku(開発環境)
### アプリケーションサーバー
- Heroku
### ソース管理
- GitHub, GitHubDesktop
### テスト
- RSpec
### エディタ
- VSCode

# 課題や今後実装したい機能

今後の課題はJavaScriptが今回のアプリケーションではほとんど使えてなかったのでもっとJavaScriptに関して勉強したいと思いました。  
今後実装したい機能は、コメント機能の追加や『いいね！』や『お気に入り』機能、そしてもっと材料や手順の入力フォーム改善して記入しやすい形に変えて行きたいです。
料理の最中にはなかなか操作できないので動画機能や音声読み上げなどの機能がつかできたらいいなと考えております。



# ER図

[![Image from Gyazo](https://i.gyazo.com/32c1c2c8c4df95f694d0c30f209bed67.png)](https://gyazo.com/32c1c2c8c4df95f694d0c30f209bed67)

## users テーブル

| Column       | Type       |Option                    |
|--------------|------------|--------------------------|
|nickname      | string     | null: false              |
|email         | string     | null: false, unique: true|


### Associations
- has_many :foods

## foods テーブル

| Column            | Type      | Option                        |
|-------------------|-----------|-------------------------------|
| name              | string    | null: false                   |
| ways              | text      | null: false                   |
| ingredients       | text      | null: false
| type_of_food_id   | integer   | null: false                   |
| user              | references| null: false, foreign_key: true|

### Associations
- belongs_to :user

### ActiveHash
- belongs_to :type_of_food