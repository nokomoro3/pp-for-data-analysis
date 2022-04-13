# 前処理大全用notebook環境

以下のデータサイエンス100本ノック環境を流用しました。

## 元から変更した部分

- 元データはここ
  - https://github.com/ghmagazine/awesomebook/tree/master/data

- DDLは以下から持ってきてます。
  - https://github.com/ghmagazine/awesomebook/blob/master/preprocess/load_data/ddl

- インポート
  - DDLは`./docker/db/init/2_create_table.sh`に書く。
  - CSVロードは`./docker/db/init/3_load.sql`に書く。

- 元環境のREADMEはこちらに置きました。環境構築の際はこっちを見た方が良いかも。
  - [./old/README.rst](./old/README.rst)