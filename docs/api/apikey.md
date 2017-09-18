---
layout: wmt/docs
title:  API Key
side-navigation: wmt/docs-navigation.html
---

# API key

## Create a new API key

Creates a new API key for a user.

* **Permissions** `apikey:create`
* **URI** `/api/v1/apikey`
* **Method** `POST`
* **Headers** `Authorization`, `Content-Type: application/json`
* **Body**
    ```json
    {
      "userId": "..."
    }
    ```
* **Success response**
    ```
    Content-Type: application/json
    ```

    ```json
    {
      "ok": true,
      "id": "...",
      "key": "..."
    }
    ```

## Delete an existing API key

Removes an existing API key.

* **Permissions** `apikey:delete`
* **URI** `/api/v1/apikey/${id}`
* **Method** `DELETE`
* **Headers** `Authorization`
* **Body**
    none
* **Success response**
    ```
    Content-Type: application/json
    ```

    ```json
    {
      "ok": true
    }
    ```
