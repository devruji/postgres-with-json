-- daily_usd_exchange_rate
CREATE TABLE IF NOT EXISTS postgres.public.daily_usd_exchange_rate (
   sourceId VARCHAR (255),
   msgTime TIMESTAMP NOT NULL,
   msgType VARCHAR (255),
   date DATE NOT NULL,
   rates JSON
);

INSERT INTO postgres.public.daily_usd_exchange_rate (
  sourceid, msgtime, msgtype, date, rates
) 
VALUES (
   'accounting-system', '2021-08-17T00:00:00+07:00', 
   'DAILY_USD_EXCHANGE_RATE', '2021-08-17', 
   '{"THB": 32.4}'
);


-- promotion
CREATE TABLE IF NOT EXISTS postgres.public.promotion (
   sourceId VARCHAR (255),
   msgTime TIMESTAMP NOT NULL,
   msgType VARCHAR (255),
   promotionId VARCHAR (255),
   promotionName VARCHAR (255),
   startTime TIMESTAMP NOT NULL,
   endTime TIMESTAMP NOT NULL,
   products TEXT[]
);

INSERT INTO postgres.public.promotion (
  sourceid, msgtime, msgtype, promotionid, 
  promotionName, starttime, endtime, 
  products
) 
VALUES (
   'promotion-management', '2020-03-21T04:02:56.490534+00:00', 
   'PromotionTimeline', 'PROMOTION_2021_1111', 
   '11/11 2021 Big Deal!!', '2021-11-11T00:00:00Z', 
   '2021-11-11T23:59:59Z', array[ 
                              'SKU_001', 'SKU_002' 
                           ]
);


-- sales_order
CREATE TABLE IF NOT EXISTS postgres.public.sales_order (
   sourceIdorder VARCHAR (255),
   msgTime TIMESTAMP NOT NULL,
   msgType VARCHAR (255),
   orderType VARCHAR (255),
   salesOrderId VARCHAR (255),
   shopId VARCHAR (255),
   createdTime TIMESTAMP NOT NULL,
   products TEXT[],
   currencyCode VARCHAR (3)
);

INSERT INTO postgres.public.sales_order (
  sourceidorder, msgtime, msgtype, ordertype, 
  salesorderid, shopid, createdtime, 
  products, currencycode
) 
VALUES (
   'order-management', '2021-08-17T12:58:34.367016+00:00', 
   'SalesOrder', 'SALES_ORDER', 'SO_001', 
   'SHOP_01', '2021-08-17T10:32:27.423491+00:00', 
   array[ 
   '{ "lineNumber": "1", "productId": "SKU_001", "quantity": 1, "grossAmount": 100.00, "items": [ { "itemId": "ITEM_001", "type": "Item", "quantity": 1 } ] }', 
   '{ "lineNumber": "2", "productId": "SKU_002", "quantity": 1, "grossAmount": 600.00, "items": [ { "itemId": "ITEM_002", "type": "Item", "quantity": 2 } ] }', 
   '{ "lineNumber": "3", "productId": "DISCOUNT_50", "quantity": 1, "grossAmount": -50.00, "referenceLineNumber": "2", "items": [ { "itemId": "DISCOUNT_50", "type": "Discount", "quantity": 1 } ] }', 
   '{ "lineNumber": "4", "productId": "DISCOUNT_10", "quantity": 1, "grossAmount": -10.00, "items": [ { "itemId": "DISCOUNT_10", "type": "Discount", "quantity": 1 } ] }', 
   '{ "lineNumber": "5", "productId": "SHIPPING_FEE", "quantity": 1, "grossAmount": 20.00, "items": [ { "itemId": "SHIPPING_FEE", "type": "Service", "quantity": 1 } ] }'
   ], 
   'THB'
);