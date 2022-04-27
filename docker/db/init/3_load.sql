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

COPY month_mst FROM '/tmp/data/monthly_index.csv'
WITH CSV HEADER
;