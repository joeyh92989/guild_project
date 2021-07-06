# Messenger
[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)
## About
This is a technical project for Guild, to build a backend API for a basic messaging app; specifcally covering the creation of a message and retreiving messages.
## Table of contents

[**About**](#about) |
[**Versions**](#versions) |
[**Setup**](#setup) |
[**Endpoints**](#endpoints) |
[**Examples**](#examples) |
[**Tests**](#running-the-tests) |
[**Database**](#database) |
[**Considerations**](#considerations) |



## Versions
* Ruby 2.5.3
* Rails 5.2.5

## Setup
If you are running this API locally, follow the steps below:
  1. Fork and clone this repo
  2. Install gem packages by running `bundle`
  3. Setup the database: `rails db:(drop,create,migrate,seed)` or `rails db:setup`
  4. Run command `rails s` and navigate to http://localhost:3000 to consume API endpoints below via your browser or postman



## Endpoints
The following are all API endpoints. Note, some endpoints have optional or required query parameters.
- All endpoints run off base connector http://localhost:3000 on local

### Messsages:

| Method   | URL                                      | Description                              | params                                 |
| -------- | ---------------------------------------- | ---------------------------------------- |----------------------------------------|
| `POST`   | `/api/v1/messages`                       | Create a new message                     |user_id: 'Integer', sender_id: 'Integer', message: 'String' |
| `get`    | `/api/v1/messages/:user_id`         | Retrieve all messages between 2 users    |sender_id: 'Integer', last_30_days: 'true' or 'false'|
| `get`    | `/api/v1/messsages`                      | Retrive all messages in the system       |last_30_days: 'true' or 'false'|

## Examples

### A successful message create
```
{
    "data": {
        "id": "6",
        "type": "message",
        "attributes": {
            "user": {
                "id": 7,
                "user_name": "Joeyh92989",
                "created_at": "2021-07-06T00:12:41.044Z",
                "updated_at": "2021-07-06T00:12:41.044Z"
            },
            "sender": {
                "id": 8,
                "user_name": "Val1234",
                "created_at": "2021-07-06T00:12:41.047Z",
                "updated_at": "2021-07-06T00:12:41.047Z"
            },
            "message": "Hello World",
            "created_at": "2021-07-06T02:34:31.745Z"
        }
    }
```

### A successful conversation retrieval
```
{
    "data": [
        {
            "id": "6",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 7,
                    "user_name": "Joeyh92989",
                    "created_at": "2021-07-06T00:12:41.044Z",
                    "updated_at": "2021-07-06T00:12:41.044Z"
                },
                "sender": {
                    "id": 8,
                    "user_name": "Val1234",
                    "created_at": "2021-07-06T00:12:41.047Z",
                    "updated_at": "2021-07-06T00:12:41.047Z"
                },
                "message": "Hello",
                "created_at": "2021-07-06T02:34:31.745Z"
            }
        },
        {
            "id": "1",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 7,
                    "user_name": "Joeyh92989",
                    "created_at": "2021-07-06T00:12:41.044Z",
                    "updated_at": "2021-07-06T00:12:41.044Z"
                },
                "sender": {
                    "id": 8,
                    "user_name": "Val1234",
                    "created_at": "2021-07-06T00:12:41.047Z",
                    "updated_at": "2021-07-06T00:12:41.047Z"
                },
                "message": "test",
                "created_at": "2021-07-06T00:12:41.074Z"
            }
        }
    ]
```

### A successful message index retrieval
```
{
    "data": [
        {
            "id": "6",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 7,
                    "user_name": "Joeyh92989",
                    "created_at": "2021-07-06T00:12:41.044Z",
                    "updated_at": "2021-07-06T00:12:41.044Z"
                },
                "sender": {
                    "id": 8,
                    "user_name": "Val1234",
                    "created_at": "2021-07-06T00:12:41.047Z",
                    "updated_at": "2021-07-06T00:12:41.047Z"
                },
                "message": "Hello",
                "created_at": "2021-07-06T02:34:31.745Z"
            }
        },
        {
            "id": "5",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 12,
                    "user_name": "Francy1234",
                    "created_at": "2021-07-06T00:12:41.056Z",
                    "updated_at": "2021-07-06T00:12:41.056Z"
                },
                "sender": {
                    "id": 7,
                    "user_name": "Joeyh92989",
                    "created_at": "2021-07-06T00:12:41.044Z",
                    "updated_at": "2021-07-06T00:12:41.044Z"
                },
                "message": "test",
                "created_at": "2021-07-06T00:12:41.094Z"
            }
        },
        {
            "id": "4",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 11,
                    "user_name": "Post1234",
                    "created_at": "2021-07-06T00:12:41.054Z",
                    "updated_at": "2021-07-06T00:12:41.054Z"
                },
                "sender": {
                    "id": 10,
                    "user_name": "Kalyn1234",
                    "created_at": "2021-07-06T00:12:41.052Z",
                    "updated_at": "2021-07-06T00:12:41.052Z"
                },
                "message": "test",
                "created_at": "2021-07-06T00:12:41.090Z"
            }
        },
        {
            "id": "3",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 11,
                    "user_name": "Post1234",
                    "created_at": "2021-07-06T00:12:41.054Z",
                    "updated_at": "2021-07-06T00:12:41.054Z"
                },
                "sender": {
                    "id": 8,
                    "user_name": "Val1234",
                    "created_at": "2021-07-06T00:12:41.047Z",
                    "updated_at": "2021-07-06T00:12:41.047Z"
                },
                "message": "test",
                "created_at": "2021-07-06T00:12:41.085Z"
            }
        },
        {
            "id": "2",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 9,
                    "user_name": "Charlie1234",
                    "created_at": "2021-07-06T00:12:41.050Z",
                    "updated_at": "2021-07-06T00:12:41.050Z"
                },
                "sender": {
                    "id": 8,
                    "user_name": "Val1234",
                    "created_at": "2021-07-06T00:12:41.047Z",
                    "updated_at": "2021-07-06T00:12:41.047Z"
                },
                "message": "test",
                "created_at": "2021-07-06T00:12:41.081Z"
            }
        },
        {
            "id": "1",
            "type": "message",
            "attributes": {
                "user": {
                    "id": 7,
                    "user_name": "Joeyh92989",
                    "created_at": "2021-07-06T00:12:41.044Z",
                    "updated_at": "2021-07-06T00:12:41.044Z"
                },
                "sender": {
                    "id": 8,
                    "user_name": "Val1234",
                    "created_at": "2021-07-06T00:12:41.047Z",
                    "updated_at": "2021-07-06T00:12:41.047Z"
                },
                "message": "test",
                "created_at": "2021-07-06T00:12:41.074Z"
            }
        }
    ]
}
```

## Running the Tests

Run all tests in application with `bundle exec rspec`. When test is complete, run `open coverage` to see where tests are being run and where they are not.

## Database

![image](https://user-images.githubusercontent.com/75232735/124534256-1713a980-ddd1-11eb-9946-4848065623d2.png)

## Considerations
### Possible Changes to Implementation
* The routes can be adjusted:
  - Entirely rely on internal user to exclusively use json payload over passing an id in the uri such as the retrieve converastion history and create does currently. I chose this current design because legibility is easier at this stage
  - The create route could be adjusted to accept the requests as `/api/v1/messages/:receiver_id/create/:sender_id` but i have chosen to avoid this at this time to reduce route complexity where a simple json payload or query param can be used.
* Strong params can be implemented to ensure more secuire pathing/routes for creation, I initially implemented this but removed it because of complexity with existing before_actions which resulted in additional lines of code and reduced readability with little gain
* To simplify the existing controller its possible to migrate some of the Active Record queries to the models or a facade; but due to line capacity not execeding Ruby standards of 10 lines or less i chose to leave within the controller. If additional logic was required this would become untenable and refactoring these to other locations would be advisable and a relatively simple change

### Other Things to Consider
* The serializer currently provides alot of detail about each message created, without a firm requirement from the FE consumer of this data i chose to provide records of the User receiving the message, Sender, and message details. This results in a somewhat complex json response, but i would think that some more/less data can be agreed upon with the consumer.
* I have chosen to enforce some basic requirements on the message, 150 characters or less, these are flexible but i felt that it would be a safe starting point and can be adjusted as needed
* I have implemented a self referential table to hold the message details; after putting this in place I didn't fully take advantage of this design. It does open up for more functionality later but at this point i don't make much use of its structure.
