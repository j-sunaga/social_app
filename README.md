# README

## Social Clone アプリ

### バージョン
Ruby:2.6.3

Rails:5.2.3

### テーブル設計

#### timelines
|culumn  |type  |
|---|---|
|id  |integer  |
|title |string  |
|content |text  |
|image |string  |
|user_id |integer |


#### users
|culumn  |type  |
|---|---|
|id  |integer  |
|name |string  |
|email |string  |
|password |password_digest |

#### friends
|culumn  |type  |
|---|---|
|id  |integer  |
|user_id |integer  |
|friend_id |integer  |
