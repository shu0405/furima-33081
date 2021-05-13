##usersテーブル
| Columun             |  Type   | Options                  |
| -----------         | ------- | -----------              |
| email               | string  |unique: true, null: false |
|encrypted_password   | string  | null: false              |
| nickname            | string  | null: false              |
| birthday            | date    | null: false              |
| first_name          | string  | null: false              |
| surname_name        | string  | null: false              |
|katakana_first_name  | string  | null: false              |
|katakana_surname_name| string  | null: false              |

###Association

- has_many :user_items
- has_many :items

##itemsテーブル
| Columun     |   Type   |  Options          |
| ----------- | -------- |  -----------      |
| name        | string   |  null: false      |
| description | text     |  null: false      |
| category_id | integer  |  null: false      |
| state_id    | integer  |  null: false      |
| burden_id   | integer  |  null: false      |
| area_id     | integer  |  null: false      |
| day_id      | integer  |  null: false      |
| price       | integer  |  null: false      |
|    user     |references| foreign_key: true |


 ###Association

-belongs_to :user
-has_one :user_item


##user_itemsテーブル
| Columun     |   Type   |  Options          |
| ----------- | -------- |  -----------      |
| user        |references| foreign_key: true |
| item        |references| foreign_key: true |

###Association

-belongs_to :user
-belongs_to :item
-has_one :address

addressesテーブル
| Columun         |  Type    | Options           |
| -----------     | -------- | -----------       |
| postal_code     | string   | null: false       |
| area_id         | integer  | null: false       |
| municipality    | string   | null: false       |
| address_number  | string   | null: false       |
| building_name   | string   |                   |
| phone_number    | string   | null: false       |
| user_item       |references| foreign_key: true |

 ###Association

- belongs_to :user_item

commentsテーブル
| Columun     |  Type    | Options           |
| ----------- | -------- | -----------       |
| text        | string   | null: false       |
| user        |references| foreign_key: true | 
| item        |references| foreign_key: true |

 ###Association

-has_many :users
-has_many :prototypes