##usersテーブル
| Columun     |  Type   | Options     |
| ----------- | ------- | ----------- |
| emal        | string  | null: false |
| password    | string  | null: false |
| name        | string  | null: false |
| nickname    | string  | null: false |
| birthday    | string  | null: false |



###Association

-has_many :items
-belongs_to :buyer

##itemsテーブル
| Columun     |   Type   |  Options          |
| ----------- | -------- |  -----------      |
| product name| string   |  null: false      |
| description | text     |  null: false      |
|  category   | string   |  null: false      |
|    state    | string   |  null: false      |
|   burden    | string   |  null: false      |
|    area     | string   |  null: false      |
|     days    | string   |  null: false      |
|    price    | string   |  null: false      |
|    user     |references| foreign_key: true |


 ###Association

-belongs_to :user
-belongs_to :buyer

buyersテーブル
| Columun         |  Type    | Options           |
| -----------     | -------- | -----------       |
| card namber     | string   | null: false       |
| expiration date | string   | null: false       | 
| security code   | string   | null: false       |
| postal code     | string   | null: false       |
| postal code     | string   | null: false       |
| prefectures     | string   | null: false       |
| municipality    | string   | null: false       |
| address         | string   | null: false       |
| building name   | string   | null: false       |
| phone number    | string   | null: false       |
| user            |references| foreign_key: true |

 ###Association

- belongs_to :user
- belongs_to :item