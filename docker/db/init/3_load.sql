-- hotel
COPY hotel_tb FROM '/tmp/data/hotel.csv'
WITH CSV HEADER
;

-- customer
COPY customer_tb FROM '/tmp/data/customer.csv'
WITH CSV HEADER
;

-- reserve
COPY reserve_tb FROM '/tmp/data/reserve.csv'
WITH CSV HEADER
;

COPY month_mst FROM '/tmp/data/month_mst.csv'
WITH CSV HEADER
;

COPY production_tb FROM '/tmp/data/production.csv'
WITH CSV HEADER
;