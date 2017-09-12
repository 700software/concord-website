---
layout: wmt/docs
title:  Security and Permissions
---


# Security

- [Managing credentials](#managing-credentials)
- [Permissions](#permissions)

## Authentication

### Using API keys

The key must be passed in the `Authorization` header on every API request. For example:
```
curl -v -H "Authorization: auBy4eDWrKWsyhiDp3AQiw" ...
```

API keys are managed using the [API key](../api/apikey.html) endpoint.

### Using Username and Password

For example:
```
curl -v -u myuser:mypwd ...
```

The actual user record will be created on the first successful authentication attempt.
After that, it can be managed as usual, by using the [User](../api/user.html) API endpoint.

Username/password authentication uses LDAP/Active Directory realm, check
[Configuration](./configuration.html#ldap) document for details.

## Managing credentials

Credentials (secrets) are managed using the [secret](../api/secret.html) API endpoint.

## Permissions

### Core

| Wildcard                  | Description                                                    | Examples                               |
|---------------------------|----------------------------------------------------------------|----------------------------------------|
| `apikey:create`           | Create a new API key.                                          |                                        |
| `apikey:delete`           | Delete any API key.                                            |                                        |
| `process:start:*`         | Starting a process from the specific project.                  | `process:start:*`, `process:start:ABC` |
| `project:create`          | Create a new project.                                          |                                        |
| `project:read:*`          | Read an existing project.                                      |                                        |
| `project:update:*`        | Update (modify) a project. E.g. add a repository to a project. | `project:update:ABC`                   |
| `project:delete:*`        | Delete specific repository.                                    |                                        |
| `secret:create`           | Create a new secret.                                           |                                        |
| `secret:delete:*`         | Delete specific secret.                                        |                                        |
| `secret:read:*`           | Read an existing secret's data.                                |                                        |
| `template:create`         | Create a new project template.                                 |                                        |
| `template:delete:*`       | Delete specific template.                                      |                                        |
| `template:update:*`       | Update specific template.                                      |                                        |
| `template:use:*`          | Use a specific template.                                       | `template:use:ansible`                 |
| `user:create`             | Create a new user.                                             |                                        |
| `user:delete`             | Delete any user.                                               |                                        |
| `user:update`             | Update any user.                                               |                                        |
| `role:create`             | Create a new role.                                             |                                        |
| `role:delete`             | Delete an existing role.                                       |                                        |
| `role:update`             | Update an existing role.                                       |                                        |
| `ldapMapping:create`      | Create a new LDAP group mapping.                               |                                        |
| `ldapMapping:delete`      | Delete an existing LDAP group mapping.                         |                                        |
| `ldapMapping:update`      | Update an existing LDAP group mapping.                         |                                        |
| `ldap:query`              | Perform a LDAP query.                                          |                                        |
