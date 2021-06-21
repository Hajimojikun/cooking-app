# README

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
| type_of_food_id   | integer   | null: false                   |
| user              | references| null: false, foreign_key: true|

### Associations
- belongs_to :user

### ActiveHash
- belongs_to :type_of_food