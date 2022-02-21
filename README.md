# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users table
| Column             | Type   | Option      |
|--------------------|--------|-------------|
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms table

| Column | Type   | Option      |
|--------|--------|-------------|
|name    | string | null: false |

### Associatoin

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## rooms_users table
| Column | type      | Option                         |
|--------|-----------|--------------------------------|
| user   | reference | null: false, foreign_key: true |
| room   | reference | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages table

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Asssociation
- belongs_to :room
- belongs_to :user
