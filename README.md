# README

# ShareMe
写真とコメントを投稿してシェアするシンプルなSNSアプリです。</br>
スクールのカリキュラムの復習のため作成してみました。

## URL
https://heroku-app-shareme.herokuapp.com/

## DB設計
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
#### Association
- has_many :posts
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :like_items, through: :likes, source: :post

### postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string||
|image|string||
|user_id|string||
|likes_count|string||
#### Association
- belongs_to :user
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes, source: :user

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|post_id|integer||
|text|text||
#### Association
- belongs_to :post
- belongs_to :user

### likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|post_id|integer||
#### Association
- belongs_to :post, counter_cache: :likes_count
- belongs_to :user

## 開発環境
Ruby(2.5.1)/Ruby on Rails(5.2.4.2)/PostgreSQL/Github/Heroku/Visual Studio Code

## DEMO
### トップページ
<img width="1395" alt="スクリーンショット 2020-04-06 14 50 05" src="https://user-images.githubusercontent.com/60685829/78526796-1844d800-7816-11ea-9708-22d946a0458b.png">

### 新規登録画面
<img width="875" alt="スクリーンショット 2020-04-06 14 58 08" src="https://user-images.githubusercontent.com/60685829/78527130-13ccef00-7817-11ea-8423-095dc738683b.png">
</br>
登録をしたユーザーでログインすると投稿することが出来ます。</br>

![25670b245a5b0848dea9d8b95f099223](https://user-images.githubusercontent.com/60685829/78527567-37446980-7818-11ea-9ade-c6b5e45781b1.gif)

## 工夫した事
- 他の人のポストに対してコメントをすることができるのですが、非同期通信で投稿出来るようにしました。</br>

![a1eab8448a589aac35739daaf1a44f1e](https://user-images.githubusercontent.com/60685829/78528360-27c62000-781a-11ea-83cf-f34716ee5642.gif)

- いいね機能を非同期通信で実装し、クリックするとカウントされもう一度クリックすると削除されるようにしました。</br>

![8de1c2eb8f3b54a996b39ee79190a12f](https://user-images.githubusercontent.com/60685829/78528639-cfdbe900-781a-11ea-9d6f-36e5a8bb05f1.gif)

## 課題
画像＆コメント投稿と他人の投稿に対してコメントといいねのすごくシンプルなSNSなので、今後のスキルとして画像の投稿でなく動画投稿、またyoutubeとのAPI連携や</br>
いいねやコメントが付いた時に誰からかの通知機能などより既存のSNS機能に近い実装が出来るようにしていきたいと思います。
