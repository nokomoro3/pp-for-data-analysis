#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username padawan --dbname dsdojo_db <<-EOSQL
    -- hotel
    drop table if exists hotel_tb;
    CREATE TABLE hotel_tb(
      hotel_id        TEXT NOT NULL,
      base_price      INTEGER NOT NULL,
      big_area_name   TEXT NOT NULL,
      small_area_name TEXT NOT NULL,
      hotel_latitude  FLOAT NOT NULL,
      hotel_longitude FLOAT NOT NULL,
      is_business     BOOLEAN NOT NULL,
      PRIMARY KEY(hotel_id)
    );

    -- customer
    drop table if exists customer_tb;
    CREATE TABLE customer_tb(
      customer_id      TEXT NOT NULL,
      age         	   INTEGER NOT NULL,
      sex      		     TEXT NOT NULL,
      home_latitude    FLOAT NOT NULL,
      home_longitude   FLOAT NOT NULL,
      primary key(customer_id)
    );

    -- reserve
    drop table if exists reserve_tb;
    CREATE TABLE reserve_tb
    (
      -- reserve_idの列を設定（データ型は文字列、NULL値をとらない制約を追加）
      reserve_id TEXT NOT NULL,

      -- hotel_idの列を設定（データ型は文字列、NULL値をとらない制約を追加）
      hotel_id TEXT NOT NULL,

      -- customer_idの列を設定（データ型は文字列、NULL値をとらない制約を追加）
      customer_id TEXT NOT NULL,

      -- reserve_datetimeの列を設定（データ型はタイムスタンプ）
      -- NULL値をとらない制約を追加
      reserve_datetime TIMESTAMP NOT NULL,

      -- checkin_dateの列を設定（データ型は日付、NULL値をとらない制約を追加）
      checkin_date DATE NOT NULL,

      -- checkin_timeの列を設定（データ型は文字列、NULL値をとらない制約を追加）
      checkin_time TEXT NOT NULL,

      -- checkout_dateの列を設定（データ型は日付、NULL値をとらない制約を追加）
      checkout_date DATE NOT NULL,

      -- people_numの列を設定（データ型は整数、NULL値をとらない制約を追加）
      people_num INTEGER NOT NULL,

      -- total_priceの列を設定（データ型は整数、NULL値をとらない制約を追加）
      total_price INTEGER NOT NULL,

      -- 主キー（テーブルの中で一意の値となる列）をreserve_idとして設定
      PRIMARY KEY(reserve_id),

      -- 外部キー（他のテーブルと同じ内容を示す列）をhotel_idに設定
      -- 対象は、ホテルマスタのホテルID
      -- 対象のKeyを持っているテーブルは、作成済みである必要がある
      -- 対象のKeyは、PRIMARY KEYに指定されている必要がある
      FOREIGN KEY(hotel_id) REFERENCES hotel_tb(hotel_id),

      -- 外部キー（他のテーブルと同じ内容を示す列）をcustomer_idに設定
      -- 対象は、顧客マスタの顧客ID
      FOREIGN KEY(customer_id) REFERENCES customer_tb(customer_id)
    );

    -- customer
    drop table if exists month_mst;
    CREATE TABLE month_mst(
      year_num        INTEGER NOT NULL,
      month_num       INTEGER NOT NULL,
      month_first_day DATE NOT NULL,
      month_last_day  DATE NOT NULL
    );

    -- production
    drop table if exists production_tb;
    create table production_tb(
      type TEXT NOT NULL,
      length FLOAT NOT NULL,
      thickness FLOAT NOT NULL,
      fault_flg BOOLEAN NOT NULL
    );
EOSQL
