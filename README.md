# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

### Association

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
| user               | references | null: false, foreign_key: true |
| content            | references | null: false, foreign_key: true |

### Association

- belongs_to :content
- belongs_to :user

## diaries テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| title              | string  | null: false |
| text               | string  | null: false |

### Association

- belongs_to :user