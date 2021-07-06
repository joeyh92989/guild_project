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

### A successful conversation retrieval

### A successful message index retrieval

## Running the Tests

Run all tests in application with `bundle exec rspec`. When test is complete, run `open coverage` to see where tests are being run and where they are not.

## Database

<!-- ![Screenshot](lib/images/ADD-A-SCREENSHOT) -->

## Considerations and Possible Changes

