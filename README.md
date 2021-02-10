##usersテーブル
| Columun             |  Type   | Options     |
| -----------         | ------- | ----------- |
| email               | string  |unique: true |
|encrypted_password   | string  | null: false |
| nickname            | string  | null: false |
| birthday            | date    | null: false |
| first_name          | string  | null: false |
| surname_name        | string  | null: false |
|katakana_first_name  | string  | null: false |
|katakana_surname_name| string  | null: false |

###Association

- has_many :user_items
- has_many :items, through: room_users
- belongs_to :address
##itemsテーブル
| Columun     |   Type   |  Options          |
| ----------- | -------- |  -----------      |
| name        | string   |  null: false      |
| description | text     |  null: false      |
| category_id | integer  |  null: false      |
| state_id    | integer  |  null: false      |
| burden_id   | integer  |  null: false      |
| area _id    | integer  |  null: false      |
| day_id      | integer  |  null: false      |
| price_id    | integer  |  null: false      |
|    user     |references| foreign_key: true |


 ###Association

-belongs_to :user
-belongs_to :

##user_itemsテーブル
| Columun     |   Type   |  Options          |
| ----------- | -------- |  -----------      |
| user_id     |references| foreign_key: true |
| item_id     |references| foreign_key: true |

###Association

-belongs_to :user
-belongs_to :item

addressテーブル
| Columun         |  Type    | Options           |
| -----------     | -------- | -----------       |
| postal_code     | string   | null: false       |
| prefectures     | string   | null: false       |
| municipality    | string   | null: false       |
| address_nambar  | string   | null: false       |
| building_name   | string   | null: false       |
| phone_number    | string   | null: false       |
| user            |references| foreign_key: true |

 ###Association

- belongs_to :user
- belongs_to :item