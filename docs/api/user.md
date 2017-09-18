---
layout: wmt/docs
title:  User
side-navigation: wmt/docs-navigation.html
---

# User

## Create a new user or update an existing one

Creates a new user with specified parameters or updates an existing one
using the specified username.

* **Permissions** `user:create`, `user:update`
* **URI** `/api/v1/user`
* **Method** `POST`
* **Headers** `Authorization`, `Content-Type: application/json`
* **Body**
    ```json
    {
      "username": "myUser",
      "permissions": [
        "project:create",
        "process:start:*",
        "..."
      ]
    }
    ```
    Permissions are optional.

    See also [the list of available permissions](../getting-started/security.html#permissions).
* **Success response**
    ```
    Content-Type: application/json
    ```

    ```json
    {
      "ok": true,
      "id" : "9be3c167-9d82-4bf6-91c8-9e28cfa34fbb",
      "created" : false
    }
    ```

    The `created` paratemer indicates whether the user was created or updated.

## Find a user

Find an existing user by name.

* **Permissions** none
* **URI** `/api/v1/user/${username}`
* **Method** `GET`
* **Headers** `Authorization`
* **Body**
    none
* **Success response**
    ```
    Content-Type: application/json
    ```

    ```json
    {
      "id" : "...",
      "name" : "myUser",
      "permissions" : [ "*:*:*" ]

    }
    ```

    The `created` paratemer indicates whether the user was created or updated.

TBD.
