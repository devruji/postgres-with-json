# postgres-with-json
To working with JSON data in PostgresDB

## Exercise:
  We provide you sample records for 3 JSON data files from Operational Systems in the "sample_data" directory for you to see the data schema. Based on the sample data schema, please do the following tasks.
  
  1. Please design and provide DDL for each table required for storing the data in a relational database.
  
  2. Using the tables you designed, please write a SQL query to show monthly sales amount in USD for each promotion.

## Exmaple data:
- **daily_usd_exchange_rate**
    ```json
        [
            {
                "sourceId": "accounting-system", 
                "msgTime": "2021-08-17T00:00:00+07:00",
                "msgType": "DAILY_USD_EXCHANGE_RATE", 
                "date": "2021-08-17",
                "rates": {
                    "THB": 32.48
                }
            }
        ]
    ```
- **promotion**
    ```json
    [
        {
            "sourceId": "promotion-management", 
            "msgTime": "2020-03-21T04:02:56.490534+00:00", 
            "msgType": "PromotionTimeline",
            "promotionId": "PROMOTION_2021_1111",
            "promotionName": "11/11 2021 Big Deal!!",
            "startTime": "2021-11-11T00:00:00Z",
            "endTime": "2021-11-11T23:59:59Z",
            "products": [
                "SKU_001",
                "SKU_002"
            ]
        }
    ]
    ```
- **sales_order**
    ```json
    [
        {
            "sourceId": "order-management", 
            "msgTime": "2021-08-17T12:58:34.367016+00:00", 
            "msgType": "SalesOrder",
            "orderType": "SALES_ORDER", 
            "salesOrderId": "SO_001",
            "shopId": "SHOP_01",
            "createdTime": "2021-08-17T10:32:27.423491+00:00",
            "products": [
                {
                    "lineNumber": "1",
                    "productId": "SKU_001",
                    "quantity": 1,
                    "grossAmount": 100.00,
                    "items": [
                        {
                            "itemId": "ITEM_001",
                            "type": "Item",
                            "quantity": 1
                        }
                    ]
                },
                {
                    "lineNumber": "2",
                    "productId": "SKU_002",
                    "quantity": 1,
                    "grossAmount": 600.00,
                    "items": [
                        {
                            "itemId": "ITEM_002",
                            "type": "Item",
                            "quantity": 2
                        }
                    ]
                },
                {
                    "lineNumber": "3",
                    "productId": "DISCOUNT_50",
                    "quantity": 1,
                    "grossAmount": -50.00,
                    "referenceLineNumber": "2",
                    "items": [
                        {
                            "itemId": "DISCOUNT_50",
                            "type": "Discount",
                            "quantity": 1
                        }
                    ]
                },
                {
                    "lineNumber": "4",
                    "productId": "DISCOUNT_10",
                    "quantity": 1,
                    "grossAmount": -10.00,
                    "items": [
                        {
                            "itemId": "DISCOUNT_10",
                            "type": "Discount",
                            "quantity": 1
                        }
                    ]
                },
                {
                    "lineNumber": "5",
                    "productId": "SHIPPING_FEE",
                    "quantity": 1,
                    "grossAmount": 20.00,
                    "items": [
                        {
                            "itemId": "SHIPPING_FEE",
                            "type": "Service",
                            "quantity": 1
                        }
                    ]
                }
            ],
            "currencyCode": "THB"
        }
    ]
    ```

## Requirement
- [PostgresDB](https://www.postgresql.org/) 14+