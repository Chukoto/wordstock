# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

### Association

- has_many :diaries
- has_many :sentences

## contents テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| part_id            | integer | null: false |
| word               | string  | null: false |

### Association

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