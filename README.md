# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name | string | null: false |
| profile | text | null: false |
| occupation | text | null: false |
| position | text | null: false |

### Association
- has_many :prototypes
- has_many :comments

## prototypesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| title | string | null: false |
| catch_copy | text | null: false |
| concept | text | null: false |
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_many :comments

## commentsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| content | text | null: false |
| prototype(FK) | references | null: false, foreign_key: true |
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype