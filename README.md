# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

## contents テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| part               | integer | null: false |
| word               | string  | null: false |

## sentences テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| english            | string  | null: false |
| japanese           | string  | null: true  |
| encrypted_password | string  | null: false |

## diaries テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| title              | string  | null: false |
| text               | string  | null: false |