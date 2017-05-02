# Concord API

## Common rules

* IDs are UUIDs, e.g. `c230ed16-f210-11e6-b8b9-97f68ea92873`;
* Resource names (projects, templates, etc) are alphanumeric strings, plus `#_.` symbols.
Must start with a character or a digit. Minumum length: 2, maximum: 128.

## The Server API

- [Project](./project.md)
- [Process](./process.md)
- [User](./user.md)
- [Role](./role.md)
- [LDAP](./ldap.md)
- [Secret](./secret.md)
- [Template](./template.md)
- [API key](./apikey.md)
- [Log](./log.md)

## Swagger

Swagger JSON is served by the server on [http://localhost:8001/swagger/swagger.json]()