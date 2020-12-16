# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

### Association

- has_many :contents
- has_many :sentences
- has_many :diaries

## contents テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| part               | integer | null: false |
| word               | string  | null: false |

### Association

- belongs_to :user
- has_many :sentences

## sentences テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| english            | string  | null: false |
| japanese           | string  | null: true  |

### Association

- belongs_to :user
- belongs_to :content

## diaries テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| title              | string  | null: false |
| text               | string  | null: false |

- belongs_to :user