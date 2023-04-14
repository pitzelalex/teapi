# Teapi

## Description

Simple API that accesses a PostgreSQL database to manage customers subscriptions to various teas. 

### Built With

    Ruby on Rails
    PostgreSQL

### Schema

![Screen Shot 2023-04-14 at 11 02 37 AM](https://user-images.githubusercontent.com/112970613/232081009-94693ab5-dd96-46bf-89f4-d02b8be25a0e.png)

### API Endpoints

#### POST Subscriptions

`/api/v1/subscriptions?tea_id={integer}&customer_id={integer}&title={string}&price={integer}&frequency={string}`

Create a new subscription.

Example:
`GET http://localhost:3000/api/v1/subscriptions?tea_id=1&customer_id=1&title=Test Sub&price=3000&frequency=3 months`
```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "tea_id": 1,
            "customer_id": 1,
            "title": "Test Sub",
            "price": 3000,
            "status": "Active",
            "frequency": "3 months"
        }
    }
}
```
#### DELETE Subscriptions

`/api/v1/subscriptions/{subscription_id}`

Delete a subscription by it's id.

Example:
`DELETE http://localhost:3000/api/v1/subscriptions/1`
```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "tea_id": 1,
            "customer_id": 1,
            "title": "Test Sub",
            "price": 3000,
            "status": "Active",
            "frequency": "3 months"
        }
    }
}
```

#### GET Customers Subscriptions
`/api/v1/customers/{customer_id}/subscriptions`

Return a collection of subscriptions belonging to a customer.

Example:
`GET http://localhost:3000/api/v1/customers/1/subscriptions`
```
{
    "data": [
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "tea_id": 1,
                "customer_id": 1,
                "title": "Test Sub",
                "price": 3000,
                "status": "Active",
                "frequency": "3 months"
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "tea_id": 1,
                "customer_id": 1,
                "title": "Another Sub",
                "price": 25000,
                "status": "Active",
                "frequency": "1.5 months"
            }
        }
    ]
}
```

### Setup

This project requires Ruby 2.7.4.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
    * Use `rails c` to enter some Customers and Teas
    * Use `rails s` to make Postman queries
