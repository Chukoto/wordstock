# アプリ名
"Wordstock" です。（未完成）

# アプリ概要
このアプリでできることは

- ログイン機能
- ゲストログイン機能
- 単語投稿機能
- 意味投稿機能
- 例文投稿機能
- プロフィール作成機能
- 日記投稿機能
- 編集履歴確認機能
- ランキング機能
- 投稿カウント機能

# 目的
- 能動的に英語学習をする
- 誰もが間違いを咎めずに学習をする
- 自分の言葉で、英語で単語を説明する
- 自分の言葉で、英語の例文を作成する
- 他人の間違えた文法を踏まえて、自分も改める

# アプリを作成した理由
英語学習はインプットして覚えるのではなく、アウトプットして初めて身につくということを、
今までの中学高校、大学、留学経験を通して感じました。

自分で1から単語の意味を英語で定義したり、自分の考えた英語の例文をシェアする機会は少ないです。
能動的に自ら発信していくことで、身につくと考え、このアプリを作成しました。


# URL
https://word-stock.herokuapp.com/


# テスト用アカウント
ゲストログインボタンがヘッダーにあります。
そちらをクリックしていただければ、ログイン完了です。


# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| content_count      | integer  | null: true  |
| description_count  | integer  | null: true  |
| sentence_count     | integer  | null: true  |
| diary_count        | integer  | null: true  |

### Association

- has_one: profile
- has_many :diaries
- has_many :contents
- has_many :descriptions
- has_many :sentences
- has_many :contents_histories

## contents テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| part_id            | integer | null: false |
| word               | string  | null: false |

### Association

- belongs_to :user
- has_many :descriptions
- has_many :sentences
- has_many :contents_histories

## descriptions テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| english_text       | string  | null: false |

### Association

- belongs_to :content
- belongs_to :user

## sentences テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| english_text       | string  | null: false |
| japanese_text      | string  | null: true  |

### Association

- belongs_to :user
- belongs_to :content

## contents_histories テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| word               | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| content            | references | null: false, foreign_key: true |

### Association

- belongs_to :content
- belongs_to :user

## diaries テーブル

| Column             | Type       | Options                           |
| ------------------ | ---------- | --------------------------------- |
| title              | string     | null: false                       |
| text               | text       | null: false                       |
| user               | references | null: false, foreign_key: true    |

### Association

- belongs_to :user

## profiles テーブル

| Column             | Type       | Options                           |
| ------------------ | ---------- | --------------------------------- |
| text               | text       | null: false                       |
| user               | references | null: false, foreign_key: true    |

### Association

- belongs_to :user
